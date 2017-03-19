module PollsHelper
  def visualize_answers_for(choice)
    content_tag :div, class: 'progress' do
      content_tag :div, class: 'progress-bar',
      style: "width: #{choice.poll.normalized_answers_for(choice)}%" do
        "#{choice.answers.count}"
      end
    end
  end


  def highest_choice(poll)
    @num = 0
    @highest_name = ''
    poll.choices.each do |choice|
      if choice.answers.count > @num
        @num = choice.answers.count
        @highest_name = choice.title
      end
    end
    return "#{@highest_name} with a vote count of #{@num}"
  end
end
