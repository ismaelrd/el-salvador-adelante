# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require jquery
#= require jquery_ujs
#= require_tree .
#= require twitter/bootstrap/alert
#= require twitter/bootstrap/dropdown
#= require tinymce-jquery
#= require jquery_nested_form
#= require bootstrap-datetimepicker
#= require locales/bootstrap-datetimepicker.es.js

$(document).ready ->
  datepicker = $(".datepicker").datetimepicker(language: 'es', pickTime: false, weekStart: 1)
