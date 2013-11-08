$(document).ready ->

  $('#history-kiitos li').on 'click', (event) ->
    event.preventDefault()
    id = $(@).data('id')
    $.get "history/#{id}"