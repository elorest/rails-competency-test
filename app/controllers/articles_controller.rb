class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params) 

    if @article.save
      redirect_to articles_path, notice: 'Article created!'
    else
      render :new
    end
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :category, :content)
  end
end
