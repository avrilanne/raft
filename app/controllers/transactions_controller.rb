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

  def initiate
    content_type :json
    request_body = {
      :_links => {
        :source => {
          :href => current_user.account_url
        },
        :destination => {
          :href => "https://api-uat.dwolla.com/accounts/db9bcc7f-b7ff-4f02-9719-4ac937d59e3a"
        }
      },
      :amount => {
        :currency => "USD",
        :value => "5.00"
      }
    }.to_json

  transfer = current_user.account_token.post "transfers", request_body
  transfer.headers[:location] # => "https://api.dwolla.com/transfers/74c9129b-d14a-e511-80da-0aa34a9b2388"
  end


# Using DwollaV2 - https://github.com/Dwolla/dwolla-v2-ruby (Recommended)







end
