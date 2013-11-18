webNotification.requestPermission = (->
  requestPermission = (browser) ->
    @request browser

  requestPermission::request = (browser)->
    $('.request').slideUp()
    if browser.match(/Chrome|Safari/g)
      webkitNotifications.requestPermission()
    else
      Notification.requestPermission()

  requestPermission
)()