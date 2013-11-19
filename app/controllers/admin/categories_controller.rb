class Admin::CategoriesController < Admin::ApplicationController
  def index
    @q = Category.search(params[:q])
    @categories = @q.result.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def update
    if category.update_attributes(category_params[:category])
      redirect_to admin_categories_path, notice: t('flash.categories.update.success') and return
    else
      render :edit
    end
  end

  private
    def category
      @category ||= params[:id] ? Category.find(params[:id]) : Category.new(category_params[:category])
    end
    helper_method :category

    def category_params
      params.permit(:id, category: [ :name, :description, :photo, :content ])
    end
end
