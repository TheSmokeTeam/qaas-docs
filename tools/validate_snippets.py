#!/usr/bin/env python3
"""End-to-end snippet validator: parse every fenced code block under docs/
and validate the body in a language-appropriate way.

Languages handled here:
  yaml       - PyYAML safe_load after stripping {{ macros }}
  json       - json.loads after stripping {{ macros }}
  bash       - bash -n (syntax-only)
  dockerfile - dockerfile_parse if available; otherwise structural sniff
  powershell - pwsh [scriptblock]::Create syntax check if pwsh is present

Languages NOT handled here (delegated to existing tools):
  csharp     - tools/ci/compile-csharp-snippets.sh + validate_csharp_snippets.py
  text, plaintext, xml - skipped (display-only)

Marker: any block preceded by an HTML comment containing 'snippet-skip' is
ignored. Same for 'allow-invalid' in the fence info string.
"""
from __future__ import annotations

import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Iterable

import yaml

REPO_ROOT = Path(__file__).resolve().parents[1]
DOCS = REPO_ROOT / "docs"
SKIP_DIR_PARTS = {"_generated"}

FENCE = re.compile(
    r"(?P<prefix>(?:^<!--[^\n]*-->\s*\n)?)^```(?P<lang>[a-zA-Z0-9_+\-]+)(?P<flags>[^\n]*)\n(?P<body>.*?)\n```",
    re.MULTILINE | re.DOTALL,
)
MACRO_VAR = re.compile(r"\{\{\s*[^{}]+?\s*\}\}")
MACRO_BLOCK = re.compile(r"\{%\s*.*?\s*%\}", re.DOTALL)


def iter_blocks(text: str) -> Iterable[tuple[str, str, str, str, int]]:
    for m in FENCE.finditer(text):
        prefix = m.group("prefix") or ""
        lang = (m.group("lang") or "").lower()
        flags = (m.group("flags") or "").strip()
        body = m.group("body")
        line = text.count("\n", 0, m.start()) + 1
        yield prefix, lang, flags, body, line


def strip_macros(s: str) -> str:
    # Remove {% raw %}/{% endraw %} explicitly so the body remains valid YAML.
    s = MACRO_BLOCK.sub("", s)
    # Replace inline {{ ... }} macros with a deterministic literal token.
    s = MACRO_VAR.sub("__MACRO__", s)
    return s


def err(path: Path, line: int, msg: str) -> None:
    rel = path.relative_to(REPO_ROOT).as_posix()
    print(f"::error file={rel},line={line}::{msg}", file=sys.stderr)


def should_skip(prefix: str, flags: str) -> bool:
    if "allow-invalid" in flags or "snippet-skip" in flags:
        return True
    if "snippet-skip" in prefix:
        return True
    return False


def validate_yaml(body: str) -> str | None:
    try:
        # Use load_all for multi-document streams.
        for _ in yaml.safe_load_all(strip_macros(body)):
            pass
        return None
    except yaml.YAMLError as e:
        return f"YAML parse error: {e.__class__.__name__}: {e}"


def validate_json(body: str) -> str | None:
    try:
        json.loads(strip_macros(body))
        return None
    except json.JSONDecodeError as e:
        return f"JSON parse error at line {e.lineno} col {e.colno}: {e.msg}"


def validate_bash(body: str, bash_bin: str | None) -> str | None:
    if not bash_bin:
        return None  # silently skip when bash missing
    # Strip leading $ prompts a user copy-pastes.
    cleaned = "\n".join(
        line[2:] if line.startswith("$ ") else line for line in body.splitlines()
    )
    try:
        r = subprocess.run(
            [bash_bin, "-n", "-c", cleaned],
            capture_output=True,
            text=True,
            timeout=10,
        )
    except subprocess.TimeoutExpired:
        return "bash -n timed out"
    if r.returncode != 0:
        return f"bash -n: {r.stderr.strip().splitlines()[-1] if r.stderr.strip() else 'syntax error'}"
    return None


def validate_dockerfile(body: str) -> str | None:
    try:
        from dockerfile_parse import DockerfileParser  # type: ignore
    except Exception:
        # Fallback: minimal structural check that honours backslash line
        # continuations and ignores blank/comment lines.
        logical: list[str] = []
        buf = ""
        for raw in body.splitlines():
            s = raw.rstrip()
            buf = (buf + "\n" + s) if buf else s
            if buf.rstrip().endswith("\\"):
                continue
            logical.append(buf)
            buf = ""
        if buf:
            logical.append(buf)
        for line in logical:
            stripped = line.lstrip()
            if not stripped or stripped.startswith("#"):
                continue
            head = stripped.split(None, 1)[0]
            if not re.match(r"^[A-Z][A-Z0-9_]*$", head):
                return f"directive {head!r} not recognised"
        return None
    tmp = tempfile.mkdtemp(prefix="dfp-")
    try:
        dfp = DockerfileParser(path=tmp)
        dfp.content = strip_macros(body)
        _ = dfp.structure
        return None
    except Exception as e:
        return f"dockerfile parse error: {e}"
    finally:
        shutil.rmtree(tmp, ignore_errors=True)


def validate_powershell(body: str, pwsh_bin: str | None) -> str | None:
    if not pwsh_bin:
        return None
    # Windows pwsh.exe needs a Windows path; cygpath/wslpath translates the
    # MSYS-style /tmp/... that NamedTemporaryFile returns on Git Bash.
    with tempfile.NamedTemporaryFile("w", suffix=".ps1", delete=False, encoding="utf-8") as f:
        f.write(body)
        raw_path = f.name
    native_path = raw_path
    try:
        for translator in ("cygpath", "wslpath"):
            tool = shutil.which(translator)
            if tool:
                t = subprocess.run([tool, "-w", raw_path], capture_output=True, text=True, timeout=5)
                if t.returncode == 0 and t.stdout.strip():
                    native_path = t.stdout.strip()
                    break
    except Exception:
        pass
    safe = native_path.replace("'", "''")
    script = (
        f"$ErrorActionPreference='Stop'; try {{ "
        f"$src = Get-Content -Raw -LiteralPath '{safe}'; "
        f"[void][scriptblock]::Create($src); exit 0 }} "
        f"catch {{ Write-Error $_.Exception.Message; exit 1 }}"
    )
    try:
        r = subprocess.run(
            [pwsh_bin, "-NoProfile", "-NonInteractive", "-Command", script],
            capture_output=True,
            text=True,
            timeout=15,
        )
    except subprocess.TimeoutExpired:
        return "pwsh parse timed out"
    finally:
        os.unlink(raw_path)
    if r.returncode != 0:
        tail = (r.stderr or r.stdout).strip().splitlines()
        msg = tail[-1] if tail else "parse error"
        return f"powershell parse: {msg}"
    return None


def main() -> int:
    bash_bin = shutil.which("bash")
    pwsh_bin = shutil.which("pwsh") or shutil.which("powershell")

    checked = {"yaml": 0, "json": 0, "bash": 0, "dockerfile": 0, "powershell": 0}
    errors = 0

    for md in sorted(DOCS.rglob("*.md")):
        if SKIP_DIR_PARTS.intersection(md.parts):
            continue
        try:
            text = md.read_text(encoding="utf-8")
        except UnicodeDecodeError as e:
            err(md, 1, f"file is not UTF-8: {e}")
            errors += 1
            continue

        for prefix, lang, flags, body, line in iter_blocks(text):
            if should_skip(prefix, flags):
                continue

            problem: str | None = None
            if lang in ("yaml", "yml"):
                problem = validate_yaml(body)
                checked["yaml"] += 1
            elif lang == "json":
                problem = validate_json(body)
                checked["json"] += 1
            elif lang in ("bash", "shell", "sh"):
                problem = validate_bash(body, bash_bin)
                checked["bash"] += 1
            elif lang == "dockerfile":
                problem = validate_dockerfile(body)
                checked["dockerfile"] += 1
            elif lang in ("powershell", "ps1", "pwsh"):
                problem = validate_powershell(body, pwsh_bin)
                checked["powershell"] += 1
            else:
                continue

            if problem is not None:
                err(md, line, f"[{lang}] {problem}")
                errors += 1

    total = sum(checked.values())
    summary = ", ".join(f"{k}={v}" for k, v in checked.items() if v)
    print(f"[validate-snippets] checked {total} blocks ({summary})")
    if errors:
        print(f"::error::{errors} snippet error(s)", file=sys.stderr)
        return 1
    print("[validate-snippets] OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
