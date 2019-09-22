class EventsController < ApplicationController

  before_action :set_event, only: [:show]

  def index
    @events = Event.includes(:attendees,:owner).where('start_date > ?', DateTime.now).order(start_date: :asc)

  end


  def show
  end



  ######################################Private methods
  private

  def set_event
    @event = Event.includes(:attendees, :owner).find(params[:id])
    session[:event_id] = params[:id]#for strip purpose
  end


end
