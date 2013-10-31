$(document).ready ->

  # Show/Hide respective buttons with a specific behavior
  manageButtons = (el) ->
    $(el).removeClass 'active'
    $('.add-kiito').addClass 'active'
    $('.manage-admins').show()
    $('.manage-kiitos').hide()

  # Comun class to delete subjects
  deleteSubject = (url, target) ->
   method = { _method: 'delete' }
   request = $.post url, method
   request.complete  ->
      $(target).parent().fadeOut()

  # Settings for typeahead.js
  $('#search_user').typeahead
    name: 'users'
    valueKey: 'name'
    prefetch:
      url: '/kiitos/users'
      ttl: 5000

  # the needed binding for showing the manage admins area
  $('.add-user').on 'click', (event) ->
    event.preventDefault()
    manageButtons @

  $('.add-kiito').on 'click', (event) ->
    event.preventDefault()
    manageButtons @

  $('.delete-admin').on 'click', (event) ->
    event.preventDefault()
    url = event.currentTarget.href
    deleteSubject url, event.currentTarget

  $('.delete-kiito').on 'click', (event) ->
    event.preventDefault()
    url = event.currentTarget.href
    deleteSubject url, event.currentTarget

  $('#add-administrator').on 'click', (event) ->
    event.preventDefault()
    $(@).hide()
    $('.add-new-administrator').show()

  $('#cancel-promote').on 'click', (event) ->
    event.preventDefault()
    $('.add-new-administrator').hide()
    $('#add-administrator').show()

  $('#promote-administrator').on 'click', (event) ->
    event.preventDefault()
    name = $('#search_user').val()
    request = $.post "admin/administrators?name=#{name}"
    request.complete (response) ->
      location.reload()
