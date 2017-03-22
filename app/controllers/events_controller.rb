class EventsController < ApplicationController

  def show
    @event = Event.find_by(id: params[:id])
    @poll = Poll.find_by(event_id: @event.id)
    if @event != nil && @poll != nil
      @events_polls = @event.polls
      @highest_location = highest_choice(@events_polls[0])
      @highest_date = highest_choice(@events_polls[1])
      @highest_time = highest_choice(@events_polls[2])
      @event.location = @highest_location
      @event.date = @highest_date
      @event.time = @highest_time
      @event.save
      @raft = @event.group
      @rsvp = Rsvp.find_by(user_id: current_user.id, event_id: params[:id])
    else
      redirect_to groups_path
    end
  end

  def new
    @group = Group.find_by(id: params[:group_id])
    if logged_in? && @group.members.include?(current_user)
      @event = Event.new
      @group = Group.find_by(id: params[:group_id])
    else
      redirect_to root_path
    end
  end

  def create
    @event = Event.new(event_params)
    @event.host_id = current_user.id
    @event.group_id = params[:group_id]
    session[:group_id] = @event.group_id
    if @event.save
      session[:event_id] = @event.id
      redirect_to new_poll_path
    else
      render :new, status: 422
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to group_path, notice: 'Event was successfully destroyed.'
  end

  private

  def event_params
    params.require(:event).permit(:host_id, :name)
  end

  def group_params

  end
end
