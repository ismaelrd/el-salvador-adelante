class Admin::LiabilitiesController < Admin::ApplicationController
  def index
    @q = Liability.includes(:category).search(params[:q])
    @liabilities = @q.result.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def create
    if liability.save
      redirect_to edit_admin_liability_path(liability), notice: t('flash.liabilities.create.success') and return
    else
      render :new
    end
  end

  def update
    if liability.update_attributes(liability_params[:liability])
      redirect_to admin_liabilities_path, notice: t('flash.liabilities.update.success') and return
    else
      render :edit
    end
  end

  def destroy
    liability.destroy
    redirect_to admin_liabilities_path, alert: t('flash.liabilities.destroy.success') and return
  end

  private
    def liability
      @liability ||= params[:id] ? Liability.find(params[:id]) : Liability.new(liability_params[:liability])
    end
    helper_method :liability

    def liability_params
      params.permit(:id, liability: [ :active, :priority, :category_id, :photo, :name, :description, :content, pictures_attributes: [:name, :attachment, :id, :_destroy, :priority], videos_attributes: [:name, :url, :id, :_destroy, :priority] ])
    end

    def categories
      @categories ||= Category.order(:name)
    end
    helper_method :categories
end
