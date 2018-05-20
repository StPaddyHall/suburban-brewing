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
  
  def edit
    @article = Article.find(params[:id])
  end
   
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Your Article has been successfully updated!"
      redirect_to article_path(@article)
    else
      render :edit
    end         
  end
   
   def destroy
      Article.find(params[:id]).destroy
      flash[:success] = "Article Deleted"
      redirect_to root_path
   end
  
  private 
   
    def article_params
       params.require(:article).permit(:title, :body, :picture)
    end
  
end