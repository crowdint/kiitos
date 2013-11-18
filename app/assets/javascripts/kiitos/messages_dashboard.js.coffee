$(document).ready ->

  $('#messages-kiitos .list-group li').on 'click', (event) ->
    event.preventDefault()
    id = $(@).data('id')
    $.get "messages/#{id}"