# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#from").datepicker
    defaultDate: "+1w"
    changeMonth: true
    numberOfMonths: 2
    onClose: (selectedDate) ->
      $("#to").datepicker "option", "minDate", selectedDate
      return

  $("#to").datepicker
    defaultDate: "+1w"
    changeMonth: true
    numberOfMonths: 2
    onClose: (selectedDate) ->
      $("#from").datepicker "option", "maxDate", selectedDate
      return

  return
