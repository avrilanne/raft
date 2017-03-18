class Group < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :events

  belongs_to :admin, foreign_key: :admin_id

  validates :admin_id, :name, presence: true
end
