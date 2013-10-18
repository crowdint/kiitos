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
    enableButton()

  # Counts how many characters remain for the message
  count = ->
    length = $('#message_message').val().length
    $('.count').text(140 - length)

  canEnableButton = ->
    $('#message_to').val() isnt '' &&
    # this is used for the selector name="message[kiitos_kiito_id]"
    $("input[name = message\\[kiitos_kiito_id\\]]").is(':checked') &&
    $('#message_message').val().length > 0

  enableButton = ->
    if canEnableButton()
      $('#submit-kiito').removeAttr 'disabled'
    else
      $('#submit-kiito').attr 'disabled', 'disabled'

  $('.list-wrapper ul li').click ->
    enableButton()

  $('#message_message').keyup ->
    enableButton()
    count()

  $('#admin-option').click ->
    $('#admin-options').show()
    $('#new-kiito').hide()
    $('#user-option').removeClass('active')
    $('#admin-option').addClass('active')

  $('#user-option').click ->
    $('#admin-options').hide()
    $('#user-option').addClass('active')
    $('#admin-option').removeClass('active')
    $('#new-kiito').show()

