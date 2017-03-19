class InvitationMailer < ApplicationMailer

  def invitation_email(invitation)
  @invitation = invitation
  @user = invitation.users.email
  @url

end
