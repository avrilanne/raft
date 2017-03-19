class MembershipsController < ApplicationController

  def index
    user = User.find_by(id: current_user.id)
    @groups = user.groups
  end

  def new

  end


end
