window.showModal or (window.showModal = {})

showModal.setDefault = (->
  setDefault = (container) ->
    @base = $('#layout')
    @content = $(container)
    @setOptions()
    @execute()
    @bindClose()
    @scrollDown()

  setDefault::base
  setDefault::content

  setDefault::setOptions = ->
    @content.dialog({
      resizable: false,
      modal:true,
      width: 400,
      height: 500,
      closeOnEscape: true,
      create: =>
        @setOverflow 'hidden'
      open: =>
        @setClass true
      beforeClose: =>
        @setOverflow 'inherit'
      close: =>
        @setClass false
    })

  setDefault::setOverflow = (attribute) ->
    @base.css 'overflow', attribute

  setDefault::setClass = (action) ->
    @base.toggleClass 'custom-overlay', action

  setDefault::bindClose = ->
    $('#close-dialog a').on 'click', (e) =>
      e.preventDefault()
      @content.dialog 'close'

  setDefault::scrollDown = ->
    $('#modal-scroll-down').on 'click', (e) =>
      e.preventDefault()
      height = $('#modal-messages-content ul').scrollTop()
      $('#modal-messages-content ul').scrollTop(height + 20)

  setDefault::execute = ->
    $(@content).dialog 'open'

  setDefault
)()