class Survey < ActiveRecord::Base
  belongs_to :event
  has_many :questions

  validates :event_id, presence: true
end
