class EventsController < ApplicationController

  def index
    @events = Event.where("group_id = params[:group_id")
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    p params
    @event = Event.new
    @group = Group.find_by(id: params[:group_id])
  end

  def create

    @event = Event.new(event_params)

    if @event.save
      redirect_to group_events_path
    else
      render :new, status: 422
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to group_events_path, notice: 'Event was successfully destroyed.'
  end

  private

  def event_params
    params.require(:event).permit(:host_id, :name, :location, :date, :time)
  end

  def group_params

  end
end
