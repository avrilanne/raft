class Group < ActiveRecord::Base
  # invitable named_by: :name
  has_many :images
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :events
  has_many :comments, as: :commentable

  belongs_to :admin, foreign_key: :admin_id

  validates :admin_id, :name, presence: true

end
