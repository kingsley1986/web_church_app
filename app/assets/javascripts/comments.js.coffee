# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.delete_comment').on  "ajax:success", (ev) ->
    $(ev.target).closest(".comment_content").remove()

document.getElementById('comment_form').onclick = ->
  console.log getAttribute('comment_form')
  return


# $ ->
#   $('.like').on 'click', (ev) ->
#     ev.preventDefault();
#     var id = $(this).attr('id').split("-")[1]
#     $.ajax
#       url: $(this).attr('href')
#       type: 'POST'
#       dataType: 'json'
#       contentType: 'application/json'
#       success : function(response) {
#         var number_of_likes = response["number_of_likes"]
#         $('.like_word_index').innerHTML("number of linkes")
#       }
#       error: function(response) {
#           var number_of_likes = response["number_of_likes"]
#           $('.like_word_index').innerHTML("number of linkes")
#       }
#     return
#
#   $('.unlike').on 'click', (ev) ->
#     ev.preventDefault();
#     var id = $(this).attr('id').split("-")[1]
#     $.ajax
#       url: $(this).attr('href')
#       type: 'DELETE'
#       dataType: 'json'
#       contentType: 'application/json'
#       success : function(response) {
#         $('.like_word_index-'+id).innerHTML("number of linkes")
#       }
#     return
#   return
