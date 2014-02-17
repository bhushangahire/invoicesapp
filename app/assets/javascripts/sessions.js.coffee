# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

winH = $(window).height()
winW = $(window).width()

jQuery ->
	$('#promo-footer').height winH * .4
	$('#promo-footer a').css marginTop: ((winH * .4) - 80) / 2
	

	