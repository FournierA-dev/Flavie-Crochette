class ArticlesController < ApplicationController
  before_action :def_article, only:[:show]


  def show
#####################POUR CREER UN COMMENTAIRE A PARTIR DU SHOW
    @commentable = @article 
    @comments = @commentable.comments
    @comment = Comment.new
#####################
  end


  def index
    @articles = Article.includes(:sub_articles,:comments).order(creation_date: :desc)
    @article_types= $article_types
  end


  private

  def def_article 
    @article = Article.find(params[:id])
  end



end




