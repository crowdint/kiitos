webNotification.create = (->
  create = (@icon, @title, @message) ->
    @verifyPermission()

  create::verifyPermission = ->
    browser = new webNotification.getPermission()
    permission = new webNotification.verifyPermission(browser.permission)
    @newAlert() if permission.type

  create::newAlert = ->
    engine = new webNotification.getEngine()
    notification = if engine.name is 'webkit'
      window.webkitNotifications.createNotification @icon, @title, @message
    else
      Notification.call @title, @message
    notification.show()
    setInterval (-> notification.cancel()), 5000

  create
)()