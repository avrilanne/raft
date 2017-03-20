class InvitationsController < ApplicationController

  def new
  end

  def index
    @group = Group.find_by(id: params[:group_id])
    @current_members = @group.memberships.pluck(:user_id)
    @invited_members = Invitation.where(group_id: @group.id).pluck(:recipient_id)

    @not_to_invite = @current_members + @invited_members

    if params[:search]
      @users = User.search(params[:search])
      @users = @users.where.not(id: @not_to_invite)

    else
      @users = User.all
      # @users = @users.where('id !=?', current_user.id)
      @users = @uses.where.not(id: @not_to_invite)

    end
  end

  def show
    @user = User.find_by(id: current_user.id)
    @invitations = @user.invitations
  end

  def create
    puts "THESE ARE THE PARAMS"
    p invitation_params
    p params
    @group = Group.find_by(id: params[:group_id])
    @invitation = Invitation.new(invitation_params)
    @invitation.group_id = params[:group_id]
      if @invitation.save
        InvitationMailer.invitation_email(@invitation).deliver
        redirect_to group_invitation_path(@group, @invitation)
      else
        format.html { render action: 'new'}
      end
  end

  private
  def invitation_params
    params.require(:invitation).permit(:sender_id, :recipient_id)
  end
end
