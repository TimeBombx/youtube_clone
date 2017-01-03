$(document).ready(function(){
  $('.sub-button').hover(function() {
    if ($(this).attr('value') == "Subscribe") return;
    
    $(this).attr('value', 'Unsubscribe');
    $(this).addClass("alert");
  }, function() {
    if ($(this).attr('value') == "Subscribe") return;
    
    $(this).attr('value', 'Subscribed');
    $(this).removeClass("alert");
  });
  
  $('.sub-button').on('click', function( event ) {
    var button = $(this);
    
    if (!button.hasClass('disabled')) {
      subUnsub(button, button.attr('value').toLowerCase());
    }
  })
});

function subUnsub(button, option) {
  var username = button.data('user');
  
  var response = $.post({
    url: "/channel/" + username + "/" + option
  });
  
  response.done(function() {
    option = option.toLowerCase();
    updateSubCount(button, username, option == "subscribe" ? "Subscribed" : "Subscribe");
  });
}

function updateSubCount(button, username, option) {
  var v = $.get({
    url: "/channel/" + username + '/subcount'
  });
  
  button.attr('value', option);
  button.removeClass("alert");
  
  v.done(function(result){ 
    $('.sub-count .callout').html(result);
  });
}