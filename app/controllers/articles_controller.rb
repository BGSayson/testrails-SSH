class ArticlesController < ApplicationController
  def index # GET /articles
    @articles = Article.all
  end

  def show # GET /articles/:id # displays a specific article
    @article = Article.find(params[:id])
  end
  
  def new # GET /articles/new #get the form to fill up to create a new article
    @article = Article.new
  end
  
  def create # POST /articles actually creates the article
    @article = Article.new(article_params)
    # @article.name = params[:name]
    # @article.body = params[:body]

    if @article.save
      redirect_to articles_path #/articles
    else
      render :new
    end
  end
  
  def edit # GET /articles/:id/edit ###gets the form to edit selected article
    @article = Article.find(params[:id])
  end
  
  def update # PUT/PATCH /articles/:id # actually modify selected article
    @article = Article.find(params[:id])
    @article.update(article_params)
    # Article.where(id: 7).update(name: "wasddahat", body: "adashuh")
    # @article.name = params[:name]
    # @article.body = params[:body]
     #/articles
    redirect_to articles_path
  end
  
  def delete #DELETE/POST /articles/:id # deletes selected article
    @article = Article.find(params[:id])
    @article = Article.delete(params[:id])
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:name, :body)
  end
end
