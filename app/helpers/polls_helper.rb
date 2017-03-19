module PollsHelper
  def visualize_answers_for(choice)
    content_tag :div, class: 'progress' do
      content_tag :div, class: 'progress-bar',
                  style: "width: #{choice.poll.normalized_answers_for(choice)}%" do
        "#{choice.answers.count}"
      end
    end
  end
end
