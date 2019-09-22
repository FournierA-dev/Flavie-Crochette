class SubArticlesController < ApplicationController
  before_action :def_sub_article, only:[:show]


  def show
#####################POUR CREER UN COMMENTAIRE A PARTIR DU SHOW
    @commentable = @sub_article 
    @comments = @commentable.comments
    @comment = Comment.new
#####################
  end


  def index
    @sub_articles = Article.includes(:sub_articles,:comments).order(creation_date: :desc)
    @article_types= $article_types
  end


  private

  def def_article 
    @sub_article = Article.find(params[:id])
  end


end
