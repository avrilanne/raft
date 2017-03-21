class Event < ActiveRecord::Base
  belongs_to :host, foreign_key: :host_id, class_name: "User"
  belongs_to :group
  has_many :polls
  has_many :rsvps
  has_many :attendees, through: :rsvps
  has_many :comments, as: :commentable
  validates :host_id, :name, presence: true
end
