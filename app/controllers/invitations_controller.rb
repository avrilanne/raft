class InvitationsController < ApplicationController

  def new
  end

  def create
    p params
    p current_user
    @user = User.find_by(id: params[:user_id])
    invitation = Invitation.new(email: @user.email, sender_id: current_user.id, recipient_id: params[:user_id] )
    redirect_to user_path(@user)
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @invitations = @user.invitations
  end

end
