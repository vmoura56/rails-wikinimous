class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article successfully created"
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  

  def show
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
      if @article.update_attributes(article_params)
        flash[:success] = "Article was successfully updated"
        redirect_to @article
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = 'Article was successfully deleted.'
      redirect_to articles_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to articles_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
