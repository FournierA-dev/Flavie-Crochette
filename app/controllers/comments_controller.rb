class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_permission, only:[:edit, :update, :destroy]
  before_action :set_comment, only:[:edit, :update, :destroy]
  before_action :load_commentable, only: [:create]

  def create
    hash = params[:comment]
    hash[:user_id] = current_user.id
    hash_params = hash.permit(:content,:user_id)
    @comment=@commentable.comments.new(hash_params)
    if @comment.save
       redirect_to @commentable, success: "Commentaire créé avec succès"
    else
      redirect_to @commentable, danger: @comment.errors.full_messages.to_sentence
    end    
  end

  # PERMISSIONS SPECIALES SI AUTEUR DU COMMENTAIRE

  def edit

  end

  def update
    hash = params[:comment]
    hash_params = hash.permit(:content)
    if @comment.update(hash_params)
      redirect_to request.referrer, success: "Commentaire modifié avec succès"
    else
      render request.referrer, danger: @comment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @comment.destroy
    redirect_to request.referrer, success: "Commentaire supprimé avec succès"
  end

  ######################################################
private

  def load_commentable
    resource,id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def user_permission
    unless current_user && @comment.user == current_user
      redirect_to request.referrer, danger: "Action non authorisé ! Vous n'êtes pas l'auteur."
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
