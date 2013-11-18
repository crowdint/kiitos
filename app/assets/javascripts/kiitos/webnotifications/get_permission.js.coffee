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