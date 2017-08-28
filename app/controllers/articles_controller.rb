class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_article, except: [:index, :new, :create]
  access all: [:index], editor: :all, [:user, :admin] => [:index, :show]

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

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article.id), notice: 'Article updated!'
    else
      flash.now[:error] = @article.errors.full_messages
      render :edit
    end
  end
  
  def show
  end

  def destroy
    if @article.user == current_user
      @article.destroy
      redirect_to articles_path, notice: 'Article deleted!'
    else
      flash.now[:error] = "You don't own this article"
      render :show
    end
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :category, :content)
  end

  def find_article
    @article = Article.find_by(id: params[:id])
  end
end
