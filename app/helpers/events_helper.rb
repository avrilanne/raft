module EventsHelper
  def raft_has_voted(event, group)
    voted = false
    group = group.members
    event.polls.each do |poll|
      if poll.answers.length == group.length
        voted = true
      else
        voted = false
      end
    end
    return voted
  end

  def user_has_voted(user, event)
    taken = 0
    taken_bool = false
    event.polls.each do |poll|
      if user.answered_for?(poll)
        taken +=1
      end
    end
    if taken == 3
      taken_bool = true
    else
      taken_bool = false
    end
    return taken_bool
  end
end








