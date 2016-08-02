class ArticlesController < ApplicationController
  def index
    @article=Article.all
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

  def edit
    @article=Article.find(params[:id])
  end

  def create
    @article=Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end
