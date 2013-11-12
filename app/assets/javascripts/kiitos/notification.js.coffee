window.webNotification or (window.webNotification = {})

webNotification.checkPermission = (=>
  checkPermission = ->
    @browser = navigator.userAgent
    @permission = new webNotification.getPermission()
    @verifyState @permission.permission

  checkPermission::browser
  checkPermission::permission

  checkPermission::verifyState = (state) ->
    if state is 1 or state is 'default'
      @askPermission()
    else if state is 2
      new webNotification.errorAlert()

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

webNotification.getPermission = (->
  getPermission = ->
    @permission = @now()

  getPermission::permission

  getPermission::now = ->
    engine = new webNotification.getEngine()
    switch engine.name
      when 'webkit'
        webkitNotifications.checkPermission()
      when 'gecko'
        Notification.permission

  getPermission
)()

webNotification.verifyPermission = (->
  verifyPermission = (permission) ->
    @type = @getPermission(permission)

  verifyPermission::getPermission = (permission) ->
    if permission is 0 or permission is 'granted'
      true
    else
      false

  verifyPermission
)()

webNotification.getEngine = (->
  getEngine = ->
    @name = @checkEngine()

  getEngine::name

  getEngine::checkEngine = ->
    browser = navigator.userAgent
    if browser.match(/Chrome/g) or browser.match(/Safari/g)
      'webkit'
    else
      'gecko'

  getEngine
)()

webNotification.requestPermission = (->
  requestPermission = (browser) ->
    @request browser

  requestPermission::request = (browser)->
    $('.request').slideUp()
    if browser.match(/Chrome/g) or browser.match(/Safari/)
      webkitNotifications.requestPermission()
    else
      Notification.requestPermission()

  requestPermission
)()

webNotification.errorAlert = (->
  errorAlert = ->
    console.log 'Web Notifications are not allowed'

  errorAlert
)()

webNotification.create = (->
  create = (title, message) ->
    @title = title
    @message = message
    @verifyPermission()

  create::title
  create::message

  create::verifyPermission = ->
    browser = new webNotification.getPermission()
    permission = new webNotification.verifyPermission(browser.permission)
    if permission.type is true then @newAlert() else new webNotification.errorAlert()

  create::newAlert = ->
    engine = new webNotification.getEngine()
    if engine.name is 'webkit'
      new Notification @title, { 'type': 'basic', 'body': @message }
    else
      Notification.call @title, @message

  create
)()