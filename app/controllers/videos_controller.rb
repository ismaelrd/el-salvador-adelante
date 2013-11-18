class VideosController < ApplicationController

  def index
  end
  
  def show
    @video = Asset::Video.find params[:id]
    render layout: false
  end
end