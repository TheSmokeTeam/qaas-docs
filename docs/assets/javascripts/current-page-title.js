function updateHeaderTitle() {
  const headerTitle = document.querySelector('[data-md-component="header-title"]');
  if (!headerTitle) {
    return;
  }

  const siteTopic = headerTitle.querySelector('.md-header__topic:not([data-md-component="header-topic"]) .md-ellipsis');
  const pageTopic = headerTitle.querySelector('[data-md-component="header-topic"] .md-ellipsis');
  if (!siteTopic || !pageTopic) {
    return;
  }

  const pageTitle = pageTopic.textContent.trim();
  if (!pageTitle) {
    return;
  }

  siteTopic.textContent = pageTitle;
}

if (typeof document$ !== 'undefined' && document$.subscribe) {
  document$.subscribe(updateHeaderTitle);
} else {
  document.addEventListener('DOMContentLoaded', updateHeaderTitle);
}
