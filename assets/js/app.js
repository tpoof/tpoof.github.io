// assets/js/app.js
// Tiny helper for assignment pages.
// - Handles nav highlighting
// - Simple asset check for images declared in data-assets (dev-only hint)

(function() {
  const here = location.pathname.replace(/\/index\.html$/, '').replace(/\/$/, '');
  const links = document.querySelectorAll('header.site-header nav a');
  links.forEach(a => {
    const href = a.getAttribute('href');
    if (!href) return;
    const target = new URL(href, location.origin);
    const normalized = target.pathname.replace(/\/index\.html$/, '').replace(/\/$/, '');
    if (normalized === here) {
      a.setAttribute('aria-current', 'page');
      a.style.fontWeight = '600';
    }
  });

  // Dev-only asset presence hint for images
  document.querySelectorAll('[data-assets]').forEach(el => {
    try {
      const list = JSON.parse(el.getAttribute('data-assets') || '[]');
      list.forEach(src => {
        const img = new Image();
        img.onload = () => { /* ok */ };
        img.onerror = () => console.warn('[asset missing?]', src);
        img.src = src;
      });
    } catch (e) {
      console.warn('Invalid data-assets JSON', e);
    }
  });
})();
