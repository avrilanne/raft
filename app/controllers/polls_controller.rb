class PollsController < ApplicationController
  def index

  end

  def new
    @poll_array = []
    3.times do
      @poll = Poll.new
      3.times { @poll.choices.build}
      @poll_array << @poll
    end
  end


  def create
    questions_array = ["location", "date", "time"]
    counter = 0
    params["poll_array"].each do |poll|
      if counter == 1
        poll = Poll.create(poll_params(poll))
        poll.group_id = session[:group_id]
        poll.event_id = session[:event_id]
        poll.question = questions_array[counter]
        poll.save
        poll.choices.each_with_index do |each_choice, i|
          if Chronic.parse(each_choice.title).exists
            poll.choices[i].title = Chronic.parse(each_choice.title).strftime("%B %d, %Y")
          end
        end
        poll.save
        counter += 1
    elsif counter == 2
        poll = Poll.create(poll_params(poll))
        poll.group_id = session[:group_id]
        poll.event_id = session[:event_id]
        poll.question = questions_array[counter]
        poll.save
        poll.choices.each_with_index do |each_choice, i|
          if Chronic.parse(each_choice.title).exists
            poll.choices[i].title = Chronic.parse(each_choice.title).strftime("%I:%M %p")
          end
        end
        poll.save
        counter += 1
    else
      poll = Poll.create(poll_params(poll))
      poll.group_id = session[:group_id]
      poll.event_id = session[:event_id]
      poll.question = questions_array[counter]
      poll.save
      counter += 1
    end
  end

    redirect_to group_path(session[:group_id])
  end

  private

  def poll_params(my_params)
    my_params.permit(:question, choices_attributes: [:id, :title])
  end
end
