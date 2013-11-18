$('#message-modal').html("<%= escape_javascript(render('modal')) %>");
new showModal.setDefault('#message-modal');