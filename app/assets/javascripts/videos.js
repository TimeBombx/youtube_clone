// $(document).ready(function() {
// });

function submitForm() {
  $( 'input:file' ).change(function() {
    // swap current form for the upload bar and edit video fields
    $('#new_video').submit();
  });
}

function uploadProgressBar() {
  var elem = $('progress');
  var value = parseInt(elem.attr('value'));
  var id = setInterval(frame, 500);
  
  function frame() {
    // var isProcessing = 
    
    if (value >= 100) {
      clearInterval(id);
    } else {
      value += 1 + Math.floor(Math.random() * 3);
      elem.attr('value', value);
    }
  }
}

function loadVideo() {
  var videoTag = $( '#example_video_1' );
  
  if ( videoTag.length ) {
    var video = videojs( 'example_video_1' );
    
    video.ready(function() {
      saveView( this );
    });
  }
}

function saveView( video ) {
  video.on('timeupdate', function() {
    var myPlayer = this;
    
    var timePercent = myPlayer.duration() - (myPlayer.duration() * 0.10);
    
    if ( myPlayer.remainingTime() < timePercent ) {
      console.log( 'save a view' );
    }
  });
}