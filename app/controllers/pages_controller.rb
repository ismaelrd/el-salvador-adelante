class PagesController < ApplicationController

  def show
    @page = Page.find params[:id]
    @media = @page.pictures + @page.videos
    set_meta_tags title: @page.name, site: 'El Salvador Adelante', reverse: true
  end
end