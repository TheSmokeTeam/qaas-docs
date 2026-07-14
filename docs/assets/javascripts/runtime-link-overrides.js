(function () {
  // Build replacement map once. Defaults+overrides are window globals set by
  // qaas-docs-build-defaults.js / qaas-docs-runtime-overrides.js, both of which
  // are static and never mutated post-load. Building the map at module scope
  // means SPA navigations under navigation.instant pay zero cost when the
  // overrides object is empty (the common case).
  var canonicalDefaults = window.__QAAS_DOCS_CANONICAL_DEFAULTS__ || {};
  var buildDefaults = window.__QAAS_DOCS_BUILD_DEFAULTS__ || {};
  var overrides = window.__QAAS_DOCS_RUNTIME_OVERRIDES__ || {};
  var replacements = new Map();

  Object.keys(buildDefaults).forEach(function (key) {
    var canonicalValue = canonicalDefaults[key];
    var buildValue = buildDefaults[key];
    var runtimeValue = overrides[key];
    if (typeof buildValue !== "string") return;

    var effectiveValue = buildValue;
    if (typeof runtimeValue === "string" && runtimeValue.trim()) {
      effectiveValue = runtimeValue.trim();
    }

    if (
      typeof canonicalValue === "string" &&
      canonicalValue &&
      canonicalValue !== effectiveValue
    ) {
      replacements.set(canonicalValue, effectiveValue);
    }
    if (buildValue && buildValue !== effectiveValue) {
      replacements.set(buildValue, effectiveValue);
    }
  });

  if (!replacements.size) {
    // No overrides configured - nothing to do, ever. Bail before subscribing.
    return;
  }

  function replaceConfiguredDefaults(value, includeShortValues) {
    var nextValue = value;
    replacements.forEach(function (replacementValue, currentValue) {
      if (!includeShortValues && currentValue.length < 8) return;
      if (nextValue.includes(currentValue)) {
        nextValue = nextValue.split(currentValue).join(replacementValue);
      }
    });
    return nextValue;
  }

  function replaceAttribute(node, attribute) {
    var currentValue = node.getAttribute(attribute);
    if (!currentValue) return;
    var nextValue = replaceConfiguredDefaults(currentValue, true);
    if (nextValue !== currentValue) node.setAttribute(attribute, nextValue);
  }

  function linePrefixForTextNode(preElement, targetNode) {
    var walker = document.createTreeWalker(preElement, NodeFilter.SHOW_TEXT);
    var linePrefix = "";

    while (walker.nextNode()) {
      var currentNode = walker.currentNode;
      if (currentNode === targetNode) return linePrefix;

      var value = currentNode.nodeValue || "";
      var lastNewline = value.lastIndexOf("\n");
      linePrefix = lastNewline === -1 ? linePrefix + value : value.slice(lastNewline + 1);
    }

    return linePrefix;
  }

  function replaceContextualShortTextNode(node) {
    var defaultRedisRepository = buildDefaults.image_redis_repository;
    var overrideRedisRepository = overrides.image_redis_repository;
    if (
      typeof defaultRedisRepository !== "string" ||
      typeof overrideRedisRepository !== "string" ||
      defaultRedisRepository.length >= 8 ||
      !overrideRedisRepository.trim() ||
      node.nodeValue !== defaultRedisRepository
    ) {
      return;
    }

    var preElement = node.parentElement && node.parentElement.closest("pre");
    if (!preElement) return;
    if (/repository\s*:\s*$/.test(linePrefixForTextNode(preElement, node))) {
      node.nodeValue = overrideRedisRepository.trim();
    }
  }

  function applyTextRuntimeOverrides() {
    var skipTags = {
      SCRIPT: true,
      STYLE: true,
      NOSCRIPT: true,
      TEXTAREA: true,
      INPUT: true
    };
    var walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, {
      acceptNode: function (node) {
        var parent = node.parentElement;
        if (!parent || skipTags[parent.tagName]) return NodeFilter.FILTER_REJECT;
        return NodeFilter.FILTER_ACCEPT;
      }
    });
    var textNodes = [];

    while (walker.nextNode()) {
      textNodes.push(walker.currentNode);
    }

    textNodes.forEach(function (node) {
      var nextValue = replaceConfiguredDefaults(node.nodeValue, false);
      if (nextValue !== node.nodeValue) node.nodeValue = nextValue;
      replaceContextualShortTextNode(node);
    });
  }

  function applyRuntimeLinkOverrides() {
    [
      ["a[href]", "href"],
      ["link[href]", "href"],
      ["meta[property='og:url'][content]", "content"],
      ["meta[name='twitter:url'][content]", "content"]
    ].forEach(function (entry) {
      var selector = entry[0];
      var attribute = entry[1];
      document.querySelectorAll(selector).forEach(function (node) {
        replaceAttribute(node, attribute);
      });
    });

    var repoTitleElement = document.querySelector(".md-source__repository");
    if (repoTitleElement) {
      repoTitleElement.textContent = replaceConfiguredDefaults(repoTitleElement.textContent, false);
    }

    if (document.title) {
      document.title = replaceConfiguredDefaults(document.title, false);
    }

    document.querySelectorAll(".md-header__topic").forEach(function (node) {
      node.textContent = replaceConfiguredDefaults(node.textContent, false);
    });

    applyTextRuntimeOverrides();
  }

  // Material's document$ observable fires on initial load AND after every
  // navigation.instant SPA swap, so this covers both cases. Fall back to
  // DOMContentLoaded if document$ isn't present (e.g. served without theme).
  if (typeof document$ !== "undefined" && document$.subscribe) {
    document$.subscribe(applyRuntimeLinkOverrides);
  } else if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", applyRuntimeLinkOverrides, { once: true });
  } else {
    applyRuntimeLinkOverrides();
  }
})();
