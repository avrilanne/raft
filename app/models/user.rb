class User < ActiveRecord::Base
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :events, through: :groups
  has_many :hosted_groups, foreign_key: :admin_id, class_name: "Group"
  has_and_belongs_to_many :polls
  has_many :answers, dependent: :destroy
  has_many :choices, through: :answers
  has_many :invitations, class_name: "Invitation", foreign_key: :recipient_id
  has_many :sent_invites, class_name: "Invitation", foreign_key: :sender_id

  has_secure_password

  validates :first_name, :last_name, :username, :email, presence: true
  validates :email, :username, uniqueness: true

  def answered_for?(poll)
    answers.any? {|v| v.choice.poll == poll}
  end

  def self.search(search)
    where("username LIKE ?", "%#{search}%")
  end
end
