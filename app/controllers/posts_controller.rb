class PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.find params[:id]
    @media = @post.pictures + @post.videos
  end
end