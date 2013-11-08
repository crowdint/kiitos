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

  $(container).dialog('open')