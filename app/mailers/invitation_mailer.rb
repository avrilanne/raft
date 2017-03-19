class InvitationMailer < ApplicationMailer
  default from: "raftproject2017@gmail.com"

  def invitation_email(invitation)
<<<<<<< HEAD
  @invitation = invitation
  @user = invitation.users.email
  @url
end
=======
    @invitation = invitation
    @sender = invitation.sender
    @recipient = invitation.recipient
    @url = "localhost:3000/sessions/new"
    mail(to: @recipient.email, subject: "You have been invited to a Raft")
  end
>>>>>>> d6b9cfdd29dbca2b1e945a459d4d2f9e9b499cf1

end
