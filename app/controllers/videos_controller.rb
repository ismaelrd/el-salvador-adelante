class VideosController < ApplicationController

  def index
    @videos = Asset::Video.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
  
  def show
    @video = Asset::Video.find params[:id]
    render layout: false
  end
end