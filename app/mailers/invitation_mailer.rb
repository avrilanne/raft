class InvitationMailer < ApplicationMailer
  default from: "raftproject2017@gmail.com"

  def invitation_email(invitation)
    @invitation = invitation
    @sender = invitation.sender
    @recipient = invitation.recipient
    @url = "https://raft2k17.herokuapp.com/"
    mail(to: @recipient.email, subject: "You have been invited to a Raft")
  end

end
