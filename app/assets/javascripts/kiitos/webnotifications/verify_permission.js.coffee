webNotification.verifyPermission = (->
  verifyPermission = (permission) ->
    @type = @getPermission(permission)

  verifyPermission::getPermission = (permission) ->
   !permission or permission is 'granted'

  verifyPermission
)()
