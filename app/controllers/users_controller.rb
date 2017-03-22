class UsersController < ApplicationController

  def new
  end

  def index
    if params[:search]
      @users = User.search(params[:search])
    else
      @users = User.all
    end

    respond_to do |format|
      format.html {@users = User.search(params[:search])}
      format.json {@users = User.search(params[:search])}
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_user(@user)
      redirect_to '/oauth/begin'
    else
      @errors = @user.errors.full_messages
      render 'new', status: 422
    end
  end


  def show
    @user = find_user
    @groups = @user.groups

    # redirect_to user_memberships_path(@user)

    # if @user.dwolla_verified == true
        # show the current user page
    # else
      # show a message that they have to register, and redirect to '/oauth/begin'
    # end

    # PSEUDOCODE for USER VIEW
    # if user.fine-owed == true
      # hide upcoming events snippets and routes
      # replace with a button to send funds to raft members
    # else
      # they can see everything
  end

  def edit
    @user = find_user
  end

  def update
    @user = find_user
    @user.update_attributes(user_params)
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :avatar)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
