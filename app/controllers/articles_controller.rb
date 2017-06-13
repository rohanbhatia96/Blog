class ArticlesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
    load_and_authorize_resource
	def index
	    @articles = Article.where(:aprrove => true)
	
	end

	def new
		@article = Article.new
	end

  def edit
  @article = Article.find(params[:id])
  end

	def create
		@article = current_user.articles.create(article_params)
  		if @article.save
  			redirect_to @article
  		else
  			render 'new'
  		end
  end

  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    
    if @article.destroy
      redirect_to articles_path
    else
      redirect_to root_path
    end
  end


  	def show
  		 @article = Article.find(params[:id])

  	end

    def to_be_approved
      @articles = Article.where(:aprrove => false)

    end

    def approve_article
      article = Article.find(params[:id])
      article.aprrove = true
      article.save
      redirect_to  to_be_approved_articles_path
    end

  	private
  def article_params
    params.require(:article).permit(:title, :text, :aprrove)
  end

end
