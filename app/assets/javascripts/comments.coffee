alert 'helolo everyone'
alert 'djkajdkajfkdjkafjdkjafkdjkjdfkjakfjdkjj'
$ ->
  $('.delete_comment').on  "ajax:success", (ev) ->
    $(ev.target).closest(".comment_content").slideUp()

$ ->
  $('.simple_form.new_comment').on  "ajax:success", (event) ->
    $('.comments').load(document.URL +  ' .comments');





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
