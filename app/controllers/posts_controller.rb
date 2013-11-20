class PostsController < ApplicationController

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
    set_meta_tags title: 'Artículos', site: 'El Salvador Adelante', reverse: true
  end

  def show
    @post = Post.find params[:id]
    @media = @post.pictures + @post.videos
    set_meta_tags title: @post.name, site: 'El Salvador Adelante', reverse: true
  end
end