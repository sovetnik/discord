key('e', function() {
  document.getElementById('edit-current').click()
});

key('a', function() {
  $('#toggle_child_form').click();
});

key('⌘+backspace, ctrl+backspace', function(event, handler){
  document.getElementById('action-back').click();
});

key('⌘+return, ctrl+return', function(event, handler){
  $('form').submit();
});

