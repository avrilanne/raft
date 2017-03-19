class ApplicationMailer < ActionMailer::Base
  # if logged_in?
  #   default from: current_user.email
  # end
  layout 'mailer'
end
