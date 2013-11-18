webNotification.getEngine = (->
  getEngine = ->
    @name = @checkEngine()

  getEngine::name

  getEngine::checkEngine = ->
    browser = navigator.userAgent
    if browser.match(/Chrome|Safari/g)
      'webkit'
    else
      'gecko'

  getEngine
)()