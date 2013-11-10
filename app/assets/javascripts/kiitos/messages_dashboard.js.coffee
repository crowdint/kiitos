$(document).ready ->

  $('#messages-kiitos li').on 'click', (event) ->
    event.preventDefault()
    id = $(@).data('id')
    $.get "messages/#{id}"