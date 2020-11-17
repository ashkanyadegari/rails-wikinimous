class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    article = params[:id]
    @article = Article.find(article)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(params_required)
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])
    @article.update(params_required)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
    def params_required
      params.require(:article).permit(:title, :content)
    end
end
