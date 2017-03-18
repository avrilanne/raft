class User < ActiveRecord::Base

has_many :memberships
has_many :groups, through: :memberships
has_many :events, through: :groups
has_many :rankings
has_many :hosted_groups, foreign_key: :admin_id, class_name: "Group"

has_secure_password

validates :first_name, :last_name, :username, :email, presence: true
validates :email, :username, uniqueness: true

  def self.search(search)
    if search
      find(:all, :conditions => ['username LIKE ?', "%#{search}%"])
    else
      @message = ["no users found"]
      find(:all)
    end
  end

end
