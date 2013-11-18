webNotification.create = (->
  create = (@icon, @title, @message) ->
    @verifyPermission()

  create::verifyPermission = ->
    browser = new webNotification.getPermission()
    permission = new webNotification.verifyPermission(browser.permission)
    @newAlert() if permission.type

  create::newAlert = ->
    engine = new webNotification.getEngine()
    notification =
      new Notification @title, { title: @title, icon: @icon, body: @message }
    notification.show()
    setInterval (-> notification.cancel()), 5000

  create
)()