class Event < ActiveRecord::Base
  belongs_to :host, foreign_key: :host_id, class_name: "User"
  belongs_to :group
  has_one :survey
  has_many :questions

  validates :host_id, :name, presence: true
end
