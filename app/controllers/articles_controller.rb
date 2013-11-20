class ArticlesController < ApplicationController

  def index
    @articles = Article.paginate(page: params[:page], per_page: 10)
    set_meta_tags title: 'Noticias', site: 'El Salvador Adelante', reverse: true
  end

  def show
    @article = Article.find params[:id]
    @media = @article.pictures + @article.videos
    set_meta_tags title: @article.name, site: 'El Salvador Adelante', reverse: true
  end
end