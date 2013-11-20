class CategoriesController < ApplicationController

  def index
    set_meta_tags title: 'El Salvador Adelante'
    render layout: false
  end
  
  def show
    @category = Category.find params[:id]
    set_meta_tags title: @category.name, site: 'El Salvador Adelante', reverse: true
  end
end