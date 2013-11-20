class PicturesController < ApplicationController

  def index
    @pictures = Asset::Picture.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    set_meta_tags title: 'Galería de imágenes', site: 'El Salvador Adelante', reverse: true
  end
end