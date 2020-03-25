document.addEventListener("turbolinks:load", function() {
  $('.border__menu-toggle').on('click', function(event) {
    event.preventDefault();
    $('body').toggleClass('offcanvas');
  })

  $('body').on('touchstart click', '.overlay', function(event) {
    event.preventDefault();
    $('body').toggleClass('offcanvas');
  });
});