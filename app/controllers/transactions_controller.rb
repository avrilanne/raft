class TransactionsController < ApplicationController
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
