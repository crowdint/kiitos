window.showModal = (container) ->
  $(container).dialog({
    resizable: false,
    modal:true,
    width: 400,
    height: 500,
    closeOnEscape: true,
    create: ->
      $('#layout').css('overflow', 'hidden')
    open: ->
      $('#layout').addClass 'custom-overlay'
    beforeClose: ->
      $('#layout').css('overflow', 'inherit')
    close: ->
      $('#layout').removeClass 'custom-overlay'
  })

  $('#close-dialog a').on 'click', (e) ->
    e.preventDefault()
    $(container).dialog 'close'

  $('#modal-scroll-down').on 'click', (e) ->
    e.preventDefault()
    height = $('#modal-messages-content ul').scrollTop()
    $('#modal-messages-content ul').scrollTop(height + 20)

  $(container).dialog('open')