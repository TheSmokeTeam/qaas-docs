(function () {
  function applyRuntimeLinkOverrides() {
    var defaults = window.__QAAS_DOCS_BUILD_DEFAULTS__ || {};
    var overrides = window.__QAAS_DOCS_RUNTIME_OVERRIDES__ || {};
    var replacements = new Map();

    Object.keys(defaults).forEach(function (key) {
      var currentValue = defaults[key];
      var overrideValue = overrides[key];

      if (typeof currentValue !== "string" || typeof overrideValue !== "string") {
        return;
      }

      var trimmedOverride = overrideValue.trim();
      if (!currentValue || !trimmedOverride || trimmedOverride === currentValue) {
        return;
      }

      replacements.set(currentValue, trimmedOverride);
    });

    if (!replacements.size) {
      return;
    }

    [
      ["a[href]", "href"],
      ["link[href]", "href"],
      ["meta[property='og:url'][content]", "content"],
      ["meta[name='twitter:url'][content]", "content"]
    ].forEach(function (entry) {
      var selector = entry[0];
      var attribute = entry[1];

      document.querySelectorAll(selector).forEach(function (node) {
        var currentValue = node.getAttribute(attribute);
        var nextValue = replacements.get(currentValue);

        if (nextValue) {
          node.setAttribute(attribute, nextValue);
        }
      });
    });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", applyRuntimeLinkOverrides, { once: true });
  } else {
    applyRuntimeLinkOverrides();
  }
})();
