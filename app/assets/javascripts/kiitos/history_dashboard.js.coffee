$(document).ready ->

  $('#history-kiitos li').on 'click', (event) ->
    event.preventDefault()
    id = $(@).data('id')
    $.get "history/#{id}"

  $('#history-modal').on 'click', '#modal-close-icon', (e) ->
    e.preventDefault()
    $('#history-modal').dialog('close')

  $('#history-modal').on 'click', '#modal-scroll-down', (e) ->
    e.preventDefault()
    height = $('#modal-messages-content ul').scrollTop()
    $('#modal-messages-content ul').scrollTop(height + 20)