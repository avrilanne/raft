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
      redirect_to group_path(@group)
    else
      render 'new', status: 422
    end
  end

private

  def group_params
    params.require(:group).permit(:name, :admin_id)
  end
end
