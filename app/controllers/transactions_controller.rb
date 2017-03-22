class TransactionsController < ApplicationController

  def charge_user
    event = Event.find_by(id: params[:event_id])
    rsvps = event.rsvps
    absent_users = []

    rsvps.each do |rsvp|
      if rsvp.present == false
        absent_user = rsvp.user_id
        absent_user.fine
      end
    end
  end

  def send_funds
    Dwolla::token = session[:token]
    @transaction_id = Dwolla::Transactions.send({
      :destinationId => '812-713-9234',  # Reflector Account ID
      :amount => params[:amount],
      :pin => params[:pin]})
    # after we verify the payment has been set
    # set the user fined variable back to false
  end





end
