import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["BBQ", "birthday party", "dinner party", "garden party", "family event"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
