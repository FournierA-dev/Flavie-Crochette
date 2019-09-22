class TutorialsController < ApplicationController
  before_action :def_tutorial, only:[:show]
  before_action :authenticate_admin_user, only: [:admin]

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def index

  end

  def destroy
  end


  private

  def def_tutorial
    @tutorial = Tutorial.find(params[:id])
  end

end
