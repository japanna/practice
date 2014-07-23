class ArticlesController < ApplicationController

	http_basic_authenticate_with name: "anna", password: "anna", except: [:index, :show]


	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
 
  		if @article.save
    		redirect_to @article
  		else
    		render 'new'
  		end
	end

	def show
  		@article = Article.find(params[:id])
	end

	def index
  		@articles = Article.all
	end

	def edit
  		@article = Article.find(params[:id])
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
  		@article.destroy
 
  		redirect_to articles_path
	end

	private #apparently private needs to come last in the controller?
		def article_params
			params.require(:article).permit(:title, :text)
	end


end
