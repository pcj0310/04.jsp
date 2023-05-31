$(document).ready(function() {
	let $sideslider = $("#sideslider");
	let $images = $sideslider.find("img");
	let currentIndex = 0;
	function initsideSlider() {
		$images.hide();
		$images.eq(0).show();
	}
	function sideslide() {
		$images.eq(currentIndex).hide();
		currentIndex = (currentIndex + 1) % $images.length;
		$images.eq(currentIndex).show();
	}
	initsideSlider();
	setInterval(sideslide, 2000);
});

$(document).ready(function() {
	let $slider = $("#slider");
	let $images = $slider.find("img");
	let currentIndex = 0;
	function initSlider() {
		$images.hide();
		$images.eq(0).show();
	}
	function slide() {
		$images.eq(currentIndex).hide();
		currentIndex = (currentIndex + 1) % $images.length;
		$images.eq(currentIndex).show();
	}
	initSlider();
	setInterval(slide, 2000);
});