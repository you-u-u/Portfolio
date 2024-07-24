import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';
import 'swiper/swiper-bundle.css';

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    console.log('SwiperController is connected');
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
  }
}
