class Admin::ArticlesController < Admin::ApplicationController
  def index
    @q = Article.search(params[:q])
    @articles = @q.result.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def create
    if article.save
      redirect_to edit_admin_article_path(article), notice: t('flash.articles.create.success') and return
    else
      render :new
    end
  end

  def update
    if article.update_attributes(article_params[:article])
      redirect_to admin_articles_path, notice: t('flash.articles.update.success') and return
    else
      render :edit
    end
  end

  def destroy
    article.destroy
    redirect_to admin_articles_path, alert: t('flash.articles.destroy.success') and return
  end

  private
    def article
      @article ||= params[:id] ? Article.find(params[:id]) : Article.new(article_params[:article])
    end
    helper_method :article

    def article_params
      params.permit(:id, article: [ :active, :featured, :photo, :name, :description, :content, pictures_attributes: [:name, :attachment, :id, :_destroy, :priority], videos_attributes: [:name, :url, :id, :_destroy, :priority] ])
    end
end
