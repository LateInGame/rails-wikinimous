class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new # Needed to instantiate the form_with
  end

  def show
    # @task = Task.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to article_path(@article)
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @article.update(article_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to articles_path(@articles)
  end

  def destroy
    @article.destroy
    # No need for app/views/tasks/destroy.html.erb
    redirect_to articles_path(@articles), status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
