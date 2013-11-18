$(document).ready ->
  # Displays the user and kiito selection areas
  $('.kiitos-list').delegate '.choose', 'click', ->
    $('.kiitos-list .list-wrapper').toggleClass 'hidden'
    $('.kiitos-list .choose').toggleClass 'btn-active'

  $('.users-list').delegate '.choose-secondary', 'click', ->
    $('.users-list .whom-selection').toggleClass 'hidden'
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

  $('#messages ul.list-group').infinitescroll
    loading:
      finishedMsg: ''
      msgText:     ''
      img:         '../assets/kiitos/GIF/progress.gif'
    navSelector:   'nav.pagination' # selector for the paged navigation (it will be hidden)
    nextSelector:  'nav.pagination a[rel=next]' # selector for the NEXT link (to page 2)
    itemSelector:  '#messages ul.list-group li.message' # selector for all items you'll retrieve
    appendCallback: true,
    ->
      updateScroll()

  $('#messages ul.list-group').infinitescroll('pause')

  $('#arrow #load-more').on 'click', (event) ->
    $('#messages ul.list-group').infinitescroll('retrieve')

  updateScroll = ->
    $('#messages').scrollTop($('#messages').get(0).scrollHeight)

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
    $('#submit-kiito').attr 'disabled', !canEnableButton()

  $('.list-wrapper ul li').click ->
    enableButton()

  $('#message_message').keyup ->
    enableButton()
    count()

  toggleOptions = (target) ->
    $('#admin-menu li').removeClass('active')
    target.addClass('active')
    $('#admin-options, #admin-manage-area').toggle()
    $('#new-kiito').toggle()
    $('#admin-header-text, #user-header-text').toggleClass('hidden')

  $('#admin-menu li').click (e)->
    e.preventDefault()
    unless $(e.currentTarget).hasClass('active')
      toggleOptions $(e.target)
