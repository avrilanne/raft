class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if logged_in?
      @group.admin_id = current_user.id
    end
    if @group.save
      current_user.groups << @group
      redirect_to group_path(@group)
    else
      @errors = @group.errors.full_messages
      render '_new', status: 422
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    @members = @group.members
    @events = @group.events
    @invitation = Invitation.where("group_id = #{@group.id} AND recipient_id = #{current_user.id}")

    # respond_to do |format|
    #   format.html {redirect_to group_path(@group)}
    #   format.js {}
    # end
  end


  def destroy
    group = Group.find_by(id: params[:id])
    group.destroy
    redirect_to groups_path, notice: 'Group was successfully destroyed.'
  end

private

  def group_params
    params.require(:group).permit(:name, :admin_id)
  end
end


