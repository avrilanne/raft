class Group < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships, class_name: "User"
  has_many :events

  belongs_to :admin, foreign_key: :admin_id, source: "User"

  validates :admin_id, :name, presence: true
end
