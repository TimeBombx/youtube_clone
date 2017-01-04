$(document).ready(function() {
  $( 'input:file' ).change(function() {
    // swap current form for the upload bar and edit video fields
  });
  
  var videoTag = $( '#example_video_1' );
  
  if ( typeof videoTag === "undefined" ) {
    loadVideo();
  }
});

function loadVideo() {
  var video = videojs( 'example_video_1' );
  
  video.ready(function() {
    saveView( this );
  });
}

function saveView(video) {
  video.on('timeupdate', function() {
    var myPlayer = this;
    
    var timePercent = myPlayer.duration() - (myPlayer.duration() * 0.10);
    
    if ( myPlayer.remainingTime() < timePercent ) {
      console.log( 'save a view' );
    }
  });
}