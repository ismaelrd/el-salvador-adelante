class PicturesController < ApplicationController

  def index
    @pictures = Asset::Picture.paginate(page: params[:page], per_page: 10)
  end
end