document.addEventListener("turbolinks:load", function() {
  $('.border__menu-toggle').on('mouseover touchstart click', function(event) {
    event.preventDefault();
    $('body').addClass('offcanvas');
    $('.content').addClass('content--offcanvas');
    $('.overlay').addClass('overlay--offcanvas');
    $('.border__logo').addClass('border__logo--offcanvas');
  })

  $('body').on('mouseover touchstart click', '.overlay--offcanvas', function(event) {
    event.preventDefault();
    $('body').removeClass('offcanvas');
    $('.content').removeClass('content--offcanvas');
    $('.overlay').removeClass('overlay--offcanvas');
    $('.border__logo').removeClass('border__logo--offcanvas');
  });
});