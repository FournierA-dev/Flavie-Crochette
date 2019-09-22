class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_amount
  
  def new
    current_user.already_pay?(@event) 
    redirect_to @event if current_user.already_pay?(@event) 
  end
  
  def create
    # Amount in cents
    strip_amount = @amount * 100
    
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken]
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: strip_amount,
      description: 'Flavie Stripe customer',
      currency: 'eur'
    })

    @event.attendances.create(
      stripe_customer_id: customer.id,
      attendee: current_user,
      attended_event: @event
    )
    redirect_to @event, success: "Paiement effectué avec succès ! Votre article va vous être envoyé rapidement"

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end






###################################################################
 private

 def set_amount
  @event = Event.find(session[:event_id])
  @amount=@event.price
 end

end
