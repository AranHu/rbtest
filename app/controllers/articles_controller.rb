class ArticlesController < ApplicationController
 # http_basic_authenticate_with name: "naive",password: "naive", except:[:index,:show]


  # 这个路由真有意思啊
  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
    @article.save
    # redirect_to @article
  end

  def show
    # params中都有什么？从哪来的?
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
    # render inline: "<h2>ERR4: 未找到您查询的数据！</h2>"
    # render inline: "xml.p {'Horrid coding practice!'}", type: :builder
    # render plain: "OK"
    # render html: "<strong>Not Found</strong>".html_safe
    # render json: @articles
    # render xml: @articles
    # render js: "alert('Hello Rails');"#这个还不会用
    # render file: filename, content_type: "application/rss"
    
    render status: 500
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

    redirect_to articles_path #这个路由我是凌乱了
  end

  private
  def article_params
    params.require(:article).permit(:title,:text)
  end
end
