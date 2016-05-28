 class ArticlesController < ApplicationController
   def index 
     @articles = Article.all
   end
  def new #this creates a new article page 
    @article = Article.new 
  end
  
  def edit #this creates a new edit window 
    @article = Article.find(params[:id])
  end
  
  def create 
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created"
      redirect_to article_path(@article)
    else 
      render 'new'
    end
  end
  
  def update 
  @article = Article.find(params[:id])
  if @article.update(article_params)
    flash[:notice] = "Article was updated!"
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end
  
  def show #this allows the user to see the articles they created  
    @article = Article.find(params[:id])
  end
  
  private
  def article_params # this allows all of the information to transfer to the DB
    params.require(:article).permit(:title, :description)
  end
end