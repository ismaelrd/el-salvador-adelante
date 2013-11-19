class PostsController < ApplicationController

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  def show
    @post = Post.find params[:id]
    @media = @post.pictures + @post.videos
  end
end