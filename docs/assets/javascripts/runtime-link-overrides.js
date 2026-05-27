(function () {
  // Build replacement map once. Defaults+overrides are window globals set by
  // qaas-docs-build-defaults.js / qaas-docs-runtime-overrides.js, both of which
  // are static and never mutated post-load. Building the map at module scope
  // means SPA navigations under navigation.instant pay zero cost when the
  // overrides object is empty (the common case).
  var defaults = window.__QAAS_DOCS_BUILD_DEFAULTS__ || {};
  var overrides = window.__QAAS_DOCS_RUNTIME_OVERRIDES__ || {};
  var replacements = new Map();

  Object.keys(defaults).forEach(function (key) {
    var currentValue = defaults[key];
    var overrideValue = overrides[key];
    if (typeof currentValue !== "string" || typeof overrideValue !== "string") return;
    var trimmedOverride = overrideValue.trim();
    if (!currentValue || !trimmedOverride || trimmedOverride === currentValue) return;
    replacements.set(currentValue, trimmedOverride);
  });

  if (!replacements.size) {
    // No overrides configured - nothing to do, ever. Bail before subscribing.
    return;
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
        var nextValue = replacements.get(node.getAttribute(attribute));
        if (nextValue) node.setAttribute(attribute, nextValue);
      });
    });

    var repoTitleElement = document.querySelector(".md-source__repository");
    if (repoTitleElement) {
      replacements.forEach(function (nextValue, currentValue) {
        if (repoTitleElement.textContent.includes(currentValue)) {
          repoTitleElement.textContent = repoTitleElement.textContent.replace(currentValue, nextValue);
        }
      });
    }

    if (document.title) {
      replacements.forEach(function (nextValue, currentValue) {
        if (document.title.includes(currentValue)) {
          document.title = document.title.replace(currentValue, nextValue);
        }
      });
    }

    document.querySelectorAll(".md-header__topic").forEach(function (node) {
      replacements.forEach(function (nextValue, currentValue) {
        if (node.textContent.includes(currentValue)) {
          node.textContent = node.textContent.replace(currentValue, nextValue);
        }
      });
    });
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
