class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  layout :layout_by_resource
  
  before_filter :init_posts

  def layout_by_resource
    if devise_controller?
      "admin/devise"
    else
      "application"
    end
  end

  def init_posts
    @featured_post = Post.where(featured: true).order(priority: :asc, created_at: :desc).first
    @last_posts = Post.order(priority: :asc, created_at: :desc).limit(4)
    @last_articles = Article.order(created_at: :desc).limit(3)
    @pages = Page.order(priority: :asc)
    @events = Event.order(start_at: :desc).limit(2)
    @tweet = Twitter.user_timeline("ESAdelante").first
  end
end
