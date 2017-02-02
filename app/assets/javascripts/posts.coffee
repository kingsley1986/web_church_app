# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('.unlike').on  "ajax:success", (ev) ->
    $(ev.target).closest(".page_wrapper_index").remove()
$ ->
  $('.like').on  "ajax:success", (ev) ->
    $(ev.target).closest(".page_wrapper_index").remove()
