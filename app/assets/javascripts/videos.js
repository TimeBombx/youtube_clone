//= require video
$(document).ready(function() {
  var video;
  
  try {
    video = videojs('example_video_1');
  } catch (err) {
    return;
  }
  
  video.ready(function(){
    this.on('timeupdate', function() {
      var myPlayer = this;
      
      var timePercent = myPlayer.duration() - (myPlayer.duration() * 0.10);
      
      
      if (myPlayer.remainingTime() < timePercent) 
      {
        console.log('save a view');
      }
    });
  });
});
