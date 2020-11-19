$('.product-filter__open').on('click', function(event) {
	event.preventDefault();
	console.log('product-filter__open fired');
	$('.product-filter--mobile').addClass('product-filter--enabled animation--slide-up').removeClass('animation--slide-down');
	$('.content').addClass('content--overlay-enabled');
})

$('.product-filter__close').on('click', function(event) {
	event.preventDefault();
	console.log('product-filter__close fired');
	$('.product-filter--mobile').addClass('animation--slide-down').removeClass('animation--slide-up');
	$('.content').removeClass('content--overlay-enabled');
})