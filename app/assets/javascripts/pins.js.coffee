# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# Same as code here: http://desandro.github.io/masonry/demos/images.html
# except it uses coffee-script, which is a simplified version of javascript


jQuery ->
	$('#pins').imagesLoaded ->
		$('#pins').masonry itemSelector: ".box"