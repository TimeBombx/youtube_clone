class VideosController < ApplicationController
  def show
    @video = Video.find_by(uid: params[:id])
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.create(video_params)
    
    if @video.save!
      redirect_to edit_video_path(@video)
    end
  end
  
  def edit
    @video = Video.find_by(uid: params[:id])
    # binding.pry
  end
  
  def update
  end
  
  def status
  end
  
  private
    def video_params
      params.require(:video).permit!
    end
end
