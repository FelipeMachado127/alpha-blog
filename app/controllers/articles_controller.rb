 class ArticlesController < ApplicationController
   before_action :set_article, only: [:edit, :update, :show, :destroy]
   
   def index 
     @articles = Article.paginate(page: params[:page], per_page: 5)
   end
  def new #this creates a new article page 
    @article = Article.new 
  end
  
  def edit #this creates a new edit window 
  end
  
  def create 
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was created"
      redirect_to article_path(@article)
    else 
      render 'new'
    end
  end
  
  def update 
 
  if @article.update(article_params)
    flash[:success] = "Article was updated!"
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end
  
  def show #this allows the user to see the articles they created  
    
  end
  
  def destroy
    
    @article.destroy
    flash[:danger] = "Article was deleted"
    redirect_to articles_path
  end
  
  private
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params # this allows all of the information to transfer to the DB
    params.require(:article).permit(:title, :description)
  end
end