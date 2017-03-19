$ ->
  $('#like_and_unlike').on  "ajax:success", (ev) ->
    $('#like_and_unlike').load(document.URL +  ' #like_and_unlike');

# $ ->
#   $('.like_and_unlike_comment').on  "ajax:success", (ev) ->
#     $('.like_and_unlike_comment').load(document.URL +  ' .like_and_unlike_comment');

$ ->
  $('.like_and_unlike_comment').on  "ajax:success", (ev) ->
    console.log(ev)
    $('.like_and_unlike_comment').toggle()
