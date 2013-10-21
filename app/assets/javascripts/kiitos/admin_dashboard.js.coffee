$(document).ready ->

  # the needed binding for showing the manage admins area
  $('.add-user').on 'click', (event) ->
    event.preventDefault()
    $(@).removeClass 'active'
    $('.add-kiito').addClass 'active'
    $('.manage-admins').show()
    $('.manage-kiitos').hide()

  $('.add-kiito').on 'click', (event) ->
    event.preventDefault()
    $(@).removeClass 'active'
    $('.add-user').addClass 'active'
    $('.manage-kiitos').show()
    $('.manage-admins').hide()

  $('.delete-admin').on 'click', (event) ->
    event.preventDefault()
    url = event.currentTarget.href
    method = { _method: 'delete' }
    request = $.post url, method
    request.complete (response) ->
      $(event.currentTarget).parent().fadeOut()

  $('.delete-kiito').on 'click', (event) ->
    event.preventDefault()
    kiito_id = event.currentTarget.id
    method = { _method: 'delete' }
    request = $.post "admin/kiitos/#{kiito_id}", method
    request.complete (response) ->
      $(event.currentTarget).parent().fadeOut()

  $('#add-administrator').on 'click', (event) ->
    console.log 'here'
    event.preventDefault()
    $(@).hide()
    $('.add-new-administrator').show()

  $('#cancel-promote').on 'click', (event) ->
    event.preventDefault()
    $('.add-new-administrator').hide()
    $('#add-administrator').show()

  $('#promote-administrator').on 'click', (event) ->
    event.preventDefault()
    alert 'this method is not yet implemented'
