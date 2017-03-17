class Event < ActiveRecord::Base
  belongs_to :host, foreign_key: :host_id, source: "User"
  belongs_to :group
  has_one :survey

  validates host_id:, name:, presence: true
end
