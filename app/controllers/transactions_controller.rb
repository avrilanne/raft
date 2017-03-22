class TransactionsController < ApplicationController
  def send_funds
    # content_type :json
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
  # binding.pry
  transfer = current_user.token.post "transfers", request_body
  p transfer
  p transfer.status
  transfer.headers[:location] # => "https://api.dwolla.com/transfers/74c9129b-d14a-e511-80da-0aa34a9b2388"
    if transfer.status == 201
      current_user.update_attributes(fine_owed: false)
    end
  redirect_to user_path(current_user)
  end
end
