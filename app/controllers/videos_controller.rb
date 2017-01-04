class VideosController < ApplicationController
  def show
    @video = Video.find_by(uid: params[:id])
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.create(video_params)
    
    if @video.save
      redirect_to video_path(@video)
    else
      
    end
  end
  
  private
    def video_params
      params.require(:video).permit!
    end
end
