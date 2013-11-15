class Admin::PagesController < Admin::ApplicationController

  def index
    @q = Page.search(params[:q])
    @pages = @q.result.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def create
    if page.save
      redirect_to edit_admin_page_path(page), notice: t('flash.pages.create.success') and return
    else
      render :new
    end
  end

  def update
    if page.update_attributes(page_params[:page])
      redirect_to admin_pages_path, notice: t('flash.pages.update.success') and return
    else
      render :edit
    end
  end

  def destroy
    page.destroy
    redirect_to admin_pages_path, alert: t('flash.pages.destroy.success') and return
  end

  private
    def page
      @page ||= params[:id] ? Page.find(params[:id]) : Page.new(page_params[:page])
    end
    helper_method :page

    def page_params
      params.permit(:id, page: [ :active, :priority, :name, :description, :content, :in_menu, pictures_attributes: [:name, :attachment, :id, :_destroy, :priority], videos_attributes: [:name, :url, :id, :_destroy, :priority] ])
    end

end
