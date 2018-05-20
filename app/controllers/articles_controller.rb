class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @article = Article.find(params[:id])
  end
   
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    
    if @article.save
       flash[:success] = "Your Article was successfully published!"
       redirect_to root_path
       
    else
       render :new
    end
  end
  
  private 
   
    def article_params
       params.require(:article).permit(:title, :body, :picture)
    end
  
end