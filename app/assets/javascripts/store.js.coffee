# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.show_more .btn', ->
  $(this).siblings('.body').stop().slideToggle('fast')

$(document).on 'click', '.properties_header', (e) ->
  table = $(this).siblings('.properties_table')
  e.preventDefault()
  table.stop().slideToggle('fast')