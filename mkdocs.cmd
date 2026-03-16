@echo off
setlocal EnableDelayedExpansion

set "ROOT=%~dp0"
pushd "%ROOT%" >nul

python -c "import mkdocs, mkdocs_macros" >nul 2>nul
if errorlevel 1 (
  echo Installing MkDocs dependencies from requirements.txt...
  python -m pip install -r "%ROOT%requirements.txt"
  if errorlevel 1 (
    popd >nul
    exit /b %errorlevel%
  )
)

set "OPEN_BROWSER=0"
set "OPEN_URL=http://127.0.0.1:8000/"
set "ARGS="
set "PREV_ARG="

:parse_args
if "%~1"=="" goto run_mkdocs

if /I "%~1"=="serve" (
  if defined ARGS (
    set "ARGS=!ARGS! "%~1""
  ) else (
    set "ARGS="%~1""
  )
  shift
  goto parse_args
)

if "%~1"=="-o" (
  set "OPEN_BROWSER=1"
  shift
  goto parse_args
)

if /I "%~1"=="--open" (
  set "OPEN_BROWSER=1"
  shift
  goto parse_args
)

if /I "%~1"=="--open-in-browser" (
  set "OPEN_BROWSER=1"
  shift
  goto parse_args
)

if /I "%PREV_ARG%"=="-a" (
  set "OPEN_URL=http://%~1/"
)

if /I "%PREV_ARG%"=="--dev-addr" (
  set "OPEN_URL=http://%~1/"
)

if /I "%~1"=="-a" set "PREV_ARG=-a"
if /I "%~1"=="--dev-addr" set "PREV_ARG=--dev-addr"
if not "%~1"=="-a" if /I not "%~1"=="--dev-addr" set "PREV_ARG="

if defined ARGS (
  set "ARGS=!ARGS! "%~1""
) else (
  set "ARGS="%~1""
)

shift
goto parse_args

:run_mkdocs
set "OPEN_URL=!OPEN_URL:http://0.0.0.0:=http://127.0.0.1:!"

if "%OPEN_BROWSER%"=="1" start "" "%OPEN_URL%"

python -m mkdocs %ARGS%
set "EXITCODE=%ERRORLEVEL%"

popd >nul
exit /b %EXITCODE%
