$(document).ready ->

  # Show/Hide respective buttons with a specific behavior
  manageButtons = (el, content) ->
    unless !el.hasClass 'active'
      $('.add-user, .add-kiito').addClass 'active'
      el.removeClass 'active'
      $('.manage-admins, .manage-kiitos').hide()
      content.show()

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
    manageButtons $(@), $('.manage-admins')

  $('.add-kiito').on 'click', (event) ->
    event.preventDefault()
    manageButtons $(@), $('.manage-kiitos')

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

  $('#add-kiito').on 'click', (event) ->
    event.preventDefault()
    $(@).hide()
    $('.add-new-kiito').show()

  $('#cancel-kiito').on 'click', (event) ->
    event.preventDefault()
    $('.add-new-kiito').hide()
    $('#form-new-kiito').trigger('reset')
    $('#add-kiito').show()

  $('#promote-administrator').on 'click', (event) ->
    event.preventDefault()
    name = $('#search_user').val()
    request = $.post "admin/administrators?name=#{name}"
    request.complete (response) ->
      location.reload()

  previewImage = (el) ->
    if el.files.length > 0
      $('.preview span').toggle()
      loadImage el
    else
      $('.preview').find('img').remove()
      $('.preview span').toggle()

  loadImage = (obj) ->
    reader = new FileReader()
    target = null

    reader.onload = (e) ->
      target = e.target or e.srcElement
      content = $('.preview')
      content.append "<img src='" + target.result + "' class='thumbnail'></img>"

    reader.readAsDataURL obj.files[0]

  $('#kiito_image').on 'change', (e) ->
    e.preventDefault()
    previewImage @

  $('.upload').on 'click', (e) ->
    e.preventDefault()
    $('#kiito_image').trigger 'click'