class CategoriesController < ApplicationController

  def index
    render layout: false
  end
  
  def show
    @category = Category.find params[:id]
  end
end