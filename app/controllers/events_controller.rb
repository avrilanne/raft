class EventsController < ApplicationController

  def index
    @games = Event.where("group_id = params[:group_id")

  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to group_event
    else
      render :new, status: 422
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_url, notice: 'event was successfully destroyed.'
  end

  private
  def event_params
    params.require(:event).permit(:name, :id)
  end

end
