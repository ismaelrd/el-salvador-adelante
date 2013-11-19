class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
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
  end
end
