window.webDevices or (window.webDevices = {})

webDevices.checkDevice = (->
  checkDevice = ->
    @browser =  navigator.userAgent
    @user_default = $('#user-dashboard').width()
    @kiito_default = $('#received-kiitos').width()
    @checkBrowser()

  checkDevice::browser
  checkDevice::user_default
  checkDevice::kiito_default

  checkDevice::checkBrowser = ->
    @bindElements() if @browser.match(/iPad/g)

  checkDevice::bindElements = ->
    $('.open').on 'click', (e) =>
      e.preventDefault()
      content = $('#received-kiitos')
      state = content.hasClass 'open'
      if state then @animationOpen() else @animationClose()

  checkDevice::animationOpen = ->
    $('#received-kiitos').animate({ width: @kiito_default + 'px' }, 500, 'linear')
    $('#user-dashboard').animate({ width: @user_default + 'px' }, 500, 'linear')
    @animationToggle()

  checkDevice::animationClose = ->
    $('#user-dashboard').animate({ width: ($('#user-dashboard').parent().width() * 0.50) + 'px'  }, 500, 'linear')
    $('#received-kiitos').animate({ width: ($('#received-kiitos').parent().width() * 0.50) + 'px' }, 500, 'linear')
    @animationToggle()

  checkDevice::animationToggle = ->
    $('#received-kiitos').toggleClass 'open'
    $('#received-kiitos').toggleClass 'mobile'
    $('#admin-menu').toggle()
    $('.form-enabled').toggle()
    $('#user-info').toggleClass 'mobile'
    $('.separator-colors').toggleClass 'mobile'
    $('.send_kiito').toggle()
    $('.return').toggle()
    $('footer').toggleClass 'mobile'

  checkDevice
)()