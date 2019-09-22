class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  before_action :authenticate_user_permission, only: [:show]
  before_action :authenticate_admin_user, only: [:admin]
  
#########COMMENT TESTER SI UN ID EXISTE EN BASE ? Le where et le find ne marchent pas quand ca existe...


  def show
    @column_names = []
    column_not_to_display = ['id','encrypted_password','reset_password_token','reset_password_sent_at','remember_created_at']
    User.column_names.each do |c_name|
      if !column_not_to_display.include?(c_name) && !/_id/.match?(c_name) && !c_name.start_with?("address","confirm","unconfirm")
        @column_names << c_name
      end
    end
  end

  ######################################Private methods
  private

  def set_user
    @user = User.includes(:proposed_events, :attended_events).find(params[:id])
  end

  def authenticate_user_permission
    if current_user != User.find(params[:id])
      redirect_to root_path, danger: "Action non authorisée - droits de lecture / écriture !"
    end
  end

end