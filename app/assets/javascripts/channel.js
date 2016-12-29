$(document).ready(function(){
  $('.sub-button').hover(function(){

    $(this).attr('value', 'Unsubscribe')
  }, function() {
    $(this).attr('value', 'Subscribed')
  });
});