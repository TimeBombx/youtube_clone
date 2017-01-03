//= require video
$(document).ready(function(){
  videojs('example_video_1').ready(function(){
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
