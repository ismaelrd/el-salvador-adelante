class PagesController < ApplicationController

  def show
    @page = Page.find params[:id]
    @media = @page.pictures + @page.videos
  end
end