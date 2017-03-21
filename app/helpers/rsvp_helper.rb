module RsvpHelper
  def rsvp_finder(current_user, event)
    rsvp = Rsvp.find_by(user_id: current_user.id, event_id: event.id)
  end
end
