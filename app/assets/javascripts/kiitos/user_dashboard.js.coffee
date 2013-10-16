$(document).ready ->
  # Displays the user and kiito selection areas
  $('.kiitos-list').delegate '.choose', 'click', ->
    $('.kiitos-list .list-wrapper').toggleClass 'hidden'
    $('.kiitos-list .choose').toggleClass 'btn-active'

  $('.users-list').delegate '.choose-secondary', 'click', ->
    $('.users-list .who-selection').toggleClass 'hidden'
    $('.users-list .choose-secondary').toggleClass 'btn-active'

  # Settings for typeahead.js
  $('#search_to').typeahead
    name: 'users'
    valueKey: 'name'
    prefetch:
      url: '/kiitos/users'
      ttl: 5000

  $('#search_to').on 'typeahead:autocompleted typeahead:selected', (e, data)->
    $('#message_to').val data.id

  # Counts how many characters remain for the message
  count = ->
    length = $('#message_message').val().length
    $('.count').text(140 - length)

  count()

  $('#message_message').keyup ->
    count()
