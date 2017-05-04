document.addEventListener("turbolinks:load", function() {
  $('.border__menu-toggle').on('mouseover touchstart click', function(event) {
    event.preventDefault();
    $('body').toggleClass('offcanvas');
  })

  $('body').on('mouseover touchstart click', '.overlay', function(event) {
    event.preventDefault();
    $('body').toggleClass('offcanvas');
  });
});