class Rsvp < ActiveRecord::Base
  belongs_to :attendee, class_name: "User", foreign_key: :user_id
  belongs_to :event

  validates :user_id, :event_id, presence: true
end
