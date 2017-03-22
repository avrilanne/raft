class RsvpsController < ApplicationController
  def new
    @rsvp = Rsvp.new
  end

  def create
    puts "THESE ARE YOUR PARAMS"
    @rsvp = Rsvp.new(user_id: current_user.id, event_id: params[:event_id])

    respond_to do |format|
      if @rsvp.save
        format.html {redirect_to :back, notice: "Ahoy!"}
        format.js {}
        format.json { render :show, status: :created, location: @rsvp}
      else
        format.html {redirect_to :back}
        format.json {render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    p params
    @rsvp = Rsvp.find_by(id: params[:id])
     if @rsvp.update_attributes(present: false)
      redirect_to :back
    else
      # show some kind of alert to the host or current user,
      # set fined boolean true, trigger some events for user
    end
  end

  def destroy
    @rsvp = Rsvp.find_by(user_id: current_user.id, event_id: params[:event_id])
    @rsvp.destroy
    redirect_to :back
    #¯\_(ツ)_/¯
  end

  # def rsvp_params
  #   params.require(:rsvp).permit(:user_id, :event_id)
  # end
end
