webNotification.checkPermission = (=>
  checkPermission = ->
    @browser = navigator.userAgent
    @permission = new webNotification.getPermission()
    @verifyState @permission.permission

  checkPermission::browser
  checkPermission::permission

  checkPermission::verifyState = (state) ->
    @askPermission() if state or state is 'default'

  checkPermission::askPermission = ->
    if @browser.match(/Chrome/g)
      @renderNotify()
    else
      new webNotification.requestPermission(@browser)

  checkPermission::renderNotify = ->
    $('body').append("<div class='request'>
      <p>Request permission to receive notifications
      <a id='request-permission' href='#'>Ask permission</a>
      </p>
      <span id='close-request'>X</span>
      </div>")
    $('.request').hide().slideDown()
    @bindRequest()

  checkPermission::bindRequest = ->
    $('#request-permission').on 'click', (e) =>
      e.preventDefault()
      new webNotification.requestPermission(@browser)

    $('#close-request').on 'click', ->
      $('.request').slideUp()

  checkPermission
)()