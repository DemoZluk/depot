# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

img_submit = ->
  # Add product to cart on image click
  #$('.store .entry > img').click ->
  #  $(this).parent().find(':submit').click();
  # Hide notice
  $('#notice').delay(2000).fadeOut(500);

$(document).ready img_submit
$(document).on "page:change", img_submit
