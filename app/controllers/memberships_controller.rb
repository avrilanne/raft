class MembershipsController < ApplicationController

  def index
    user = User.find_by(id: current_user.id)
    @groups = user.groups
  end

  def new
    @membership = Membership.new
  end

  def create
    p params
    @membership = Membership.new(group_id: params[:user][:group_id], user_id: params[:user_id])
    @recipient = User.find_by(id: params[:user_id])
    # make a new membership
      if @membership.save
        if @membership.paid == true
        #do something
      else
        #redirect somewhere
        render 'confirmation'
      end
    else
      #send them to a page that says they have to pay
    end
  end
end
