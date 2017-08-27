class WelcomeController < ApplicationController
  def index
    @articles = Article.first_three_from_each_category
  end
end
