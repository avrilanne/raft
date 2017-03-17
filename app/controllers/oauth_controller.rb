class OauthController < ApplicationController
  def begin
    # declare the URL where the user will be sent to after granting permission to your app:
    return_url = url_for action: 'return'

    # scopes are the permissions we're asking for, deliminated by "|"
    # Learn more: https://developers.dwolla.com/dev/pages/auth#scopes
    scopes = "accountinfofull|balance|send"

    @oauth_url = Dwolla::OAuth.get_auth_url(return_url, scopes)
  end

  def return
    # extract verification code from GET querystring param "code":
    verify_code = params[:code]

    # declare the same URL from step 1:
    return_url = url_for action: 'return'

    session[:token] = Dwolla::OAuth.get_token(verify_code, return_url)
  end
end
