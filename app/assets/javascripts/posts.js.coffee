# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#post-masonry-container').imagesLoaded -> 
		$('#post-masonry-container').masonry 
			itemSelector: '.box-masonry'
			isFitWidth: true
