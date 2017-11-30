import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["BBQ", "Birthday Party", "Dinner Party", "Garden Party", "Family event"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
