class ImagesController < ApplicationController

  def new
    @image = Image.new
  end


  def create
    p "PARAMSSS"
    p params
    @image = Image.new(image_params)
    @image.group_id = params[:group_id]
    @image.save
    p"hello"
    p @image
    redirect_to :back
  end


  def show
    @image = Image.find_by(group_id:params[:group_id])
  end

  private
  def image_params
    params.require(:image).permit(:group_image)
  end
end
