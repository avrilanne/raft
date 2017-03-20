class MembershipsController < ApplicationController

  def index
    if logged_in?
      user = User.find_by(id: current_user.id)
      @groups = user.groups.all
      redirect_to user_path(user)
    else
      render 'welcome/index'
    end
  end

  def new
    @membership = Membership.new
  end

  def create
    p params
    @membership = current_user.memberships.new(membership_params)
    @membership.user_id = current_user.id
    @invitation = Invitation.where("group_id = #{@membership.group_id} AND recipient_id = #{current_user.id}").first
      if @membership.save
        @invitation.destroy
        redirect_to user_path(current_user)
      else
        render 'confirmation'
      end
  end

  private

  def membership_params
    params.require(:membership).permit(:group_id)
  end

end
# group_id: params[:user][:group_id], user_id: params[:user_id]
