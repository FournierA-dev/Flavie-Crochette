class BlogArticlesController < ApplicationController
  def index
  end

  def show
#####################POUR CREER UN COMMENTAIRE A PARTIR DU SHOW
@commentable = Article.first
@comments = @commentable.comments
@comment = Comment.new
#####################
  end

  def new
  end

  def destroy
  end

  def edit
  end

  def create
  end

  def update
  end
end
