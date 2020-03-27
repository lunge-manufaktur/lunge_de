$('.product-images__thumbnail').on('click', function() {
	console.log('image clicked');
	var imageURL = $(this).data('url-large');
	$('.product-images__main-image').attr('src', imageURL);
	$('.product-images__thumbnail').removeClass('product-images__thumbnail--active');
	$(this).toggleClass('product-images__thumbnail--active')
	console.log(imageURL);
});