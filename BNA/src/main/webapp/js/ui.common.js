$(document).ready(function(){
    // 메인슬라이더
   var mainSlider = new Swiper ('.main_slider', {
    loop: true,
    speed: 1000,
    effect: 'fade',
    // autoplay: {
    //    delay: 10000,
    //    disableOnInteraction: false,
    // },
    pagination: {
      el: '.swiper-pagination',
      type: 'bullets',
      clickable: true,
    },
  })


});