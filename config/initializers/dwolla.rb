require 'dwolla'

Dwolla::api_key = ENV['DWOLLA_APP_KEY']
Dwolla::api_secret = ENV['DWOLLA_APP_SECRET']

$dwolla = DwollaV2::Client.new(key: Dwolla::api_key, secret: Dwolla::api_secret)
