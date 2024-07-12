// Entry point for the build script in your package.json
console.log('application.js is loaded'); // 追加するログ
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import Swiper from 'swiper/bundle';
import 'swiper/swiper-bundle.css';

document.addEventListener('turbo:load', () => {
  const swiperContainer = document.querySelector('.swiper-container');
  if (swiperContainer) {
    const swiper = new Swiper(swiperContainer, {
      slidesPerView: 'auto',
      spaceBetween: 20,
      loop: true,
      autoplay: {
        delay: 0,
        disableOnInteraction: false,
      },
      speed: 5000,
      centeredSlides: true,
    });
  } else {
    console.error('Swiper container not found!');
  }
});