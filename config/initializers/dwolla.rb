
Dwolla::api_key = ENV['DWOLLA_APP_KEY']
Dwolla::api_secret = ENV['DWOLLA_APP_SECRET']
Dwolla::sandbox = true

$dwolla = DwollaV2::Client.new(key: ENV['DWOLLA_APP_KEY'], secret: ENV['DWOLLA_APP_SECRET']) do |config|
    config.environment = :sandbox
  end
