module Admin
  class EventsController < ApplicationController
    before_action :set_event, only: [:update,:edit,:destroy]

    def new
      @event = Event.new()
    end

    def create
      @event = Event.new()
      hash_params = params.require(:event).permit(:duration,:title,:description,:price,:location,:start_date)
      hash_params[:owner] = current_user
      @event = Event.new(hash_params)
      if @event.save
        redirect_to event_path(@event.id), success: "Evénnement créé avec succès"
      else
        render 'new'
      end
    end

    def destroy

    end

    ######################################Private methods
    private

    def set_event
      @event = Event.includes(:attendees, :owner).find(params[:id])
    end

  end

end