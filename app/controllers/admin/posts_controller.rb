class Admin::PostsController < Admin::ApplicationController

  def index
    @q = Post.search(params[:q])
    @posts = @q.result.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def create
    if post.save
      redirect_to edit_admin_post_path(post), notice: t('flash.posts.create.success') and return
    else
      render :new
    end
  end

  def update
    if post.update_attributes(post_params[:post])
      redirect_to admin_posts_path, notice: t('flash.posts.update.success') and return
    else
      render :edit
    end
  end

  def destroy
    post.destroy
    redirect_to admin_posts_path, alert: t('flash.posts.destroy.success') and return
  end

  private
    def post
      @post ||= params[:id] ? Post.find(params[:id]) : Post.new(post_params[:post])
    end
    helper_method :post

    def post_params
      params.permit(post: [ :active, :featured, :photo, :name, :description, :content ])
    end

end
