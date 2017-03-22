class OauthController < ApplicationController
  def begin
    # declare the URL where the user will be sent to after granting permission to your app:
    return_url = "http://localhost:3000/oauth/return"


    logger.info return_url
    # scopes are the permissions we're asking for, deliminated by "|"
    # Learn more: https://developers.dwolla.com/dev/pages/auth#scopes
    scopes = "accountinfofull|balance|send"

    @oauth_url = auth.url
    # @oauth_url = Dwolla::OAuth.get_auth_url(return_url, scopes)
  end

  def return
    # binding.pry
    @account_token = auth.callback(params)
    root = @account_token.get '/'
    p session[:url] = root._links.account.href
    funding_sources = @account_token.get "#{session[:url]}/funding-sources"
    funding_sources._embedded['funding-sources'][0]
    funding_sources_id = funding_sources._embedded['funding-sources'][0]['id']

    binding.pry
    # session[:token] = @account_token
    # extract verification code from GET querystring param "code":
    # verify_code = params[:code]

    # logger.info verify_code
    # # declare the same URL from step 1:
    # return_url = url_for action: 'return'

    # logger.info return_url
    # session[:token] = Dwolla::OAuth.get_token(verify_code, return_url)
    ## WORKED:
    # root = @account_token.get "/"
    #account_url = root._links.account.href  --source and destination of transf
    #account = @account_token.get account_url
    redirect_to user_path(current_user)
  end

  def authenticate
    redirect_to auth.url
  end

  def callback
    account_token = auth.callback(params)
  end

  private

  def auth
     return_url = "http://localhost:3000/oauth/return"
    $dwolla.auths.new redirect_uri: return_url, scope: "accountinfofull|balance|send|funding", state: session[:state] ||= SecureRandom.hex
  end
end
