class PollsController < ApplicationController
  def index

  end

  def new
    @poll = Poll.new
    3.times { @poll.choices.build}
    p session.inspect
  end


  def create
    @poll = Poll.new(poll_params)
    @poll.group_id = session[:group_id]
    @poll.event_id = session[:event_id]
    p '*********************'
    p @poll
    if @poll.save
      redirect_to group_path(@poll.group_id)
    else
      render :new, status: 422
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:title, :question, choices_attributes: [:id, :title])
  end
end
