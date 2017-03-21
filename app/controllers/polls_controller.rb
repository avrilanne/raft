class PollsController < ApplicationController
  def index

  end

  def new
    @poll_array = []
    2.times do
      @poll = Poll.new
      3.times { @poll.choices.build}
      @poll_array << @poll
    end
  end


  def create
    questions_array = ["date", "time"]
    counter = 0
    params["poll_array"].each do |poll|
      poll = Poll.create(poll_params(poll))
      poll.group_id = session[:group_id]
      poll.event_id = session[:event_id]
      poll.question = questions_array[counter]
      poll.save
      counter += 1
    end
    redirect_to group_path(session[:group_id])
  end

  private

  def poll_params(my_params)
    my_params.permit(:question, choices_attributes: [:id, :title])
  end
end
