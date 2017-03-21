class ImagesController < ApplicationController

  def new
    @image = Image.new
  end


  def create
    @image = Image.new(image_params)
    @image.group_id = params[:id]
    @image.save
    redirect_to :back
  end


  def show
    @image = Image.find_by(group_id:params[:id])
  end

  private
  def image_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :avatar)
  end
end
