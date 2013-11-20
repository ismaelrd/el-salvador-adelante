class VideosController < ApplicationController

  def index
    @videos = Asset::Video.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    set_meta_tags title: 'Galería de videos', site: 'El Salvador Adelante', reverse: true
  end
  
  def show
    @video = Asset::Video.find params[:id]
    render layout: false
  end
end