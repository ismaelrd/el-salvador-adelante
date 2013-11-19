class PicturesController < ApplicationController

  def index
    @pictures = Asset::Picture.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end