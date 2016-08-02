class ArticlesController < ApplicationController
  def index
  end

  def new
    @article=Article.new
  end

  def create
    @article = Article.new(
      title: params[:article][:title],
      body: params[:article][:body])
    if @article.save
      redirect_to article_path(@article.id)
    else
      render :new
    end
  end

  def show
    @article=Article.find(params[:id])
  end
end
