class User < ActiveRecord::Base

  has_attached_file :avatar, styles: {tiny:"50x50#", thumb: "100x100#"}, default_url: "thumb/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_merit

  has_many :memberships
  has_many :groups, through: :memberships
  has_many :events, through: :groups
  has_many :hosted_groups, foreign_key: :admin_id, class_name: "Group"
  has_and_belongs_to_many :polls
  has_many :answers, dependent: :destroy
  has_many :choices, through: :answers
  has_many :invitations, class_name: "Invitation", foreign_key: :recipient_id
  has_many :sent_invites, class_name: "Invitation", foreign_key: :sender_id
  has_many :rsvps
  has_many :upcoming_events, through: :rsvps, source: :event

  has_secure_password

  validates :first_name, :last_name, :username, :email, presence: true
  validates :email, :username, uniqueness: true

  def token
    $dwolla.tokens.new(access_token: self.access_token, refresh_token: self.refresh_token)
  end

  def answered_for?(poll)
    answers.any? {|v| v.choice.poll == poll}
  end

  def fine
    self.fine_owed = true
    self.save
  end

  def self.search(search)
    where("username LIKE ?", "%#{search}%")
  end

  def rsvp?(event)
    attending = false
    self.upcoming_events.each do |e|
      if e.id == event.id
        attending = true
      end
    end
    return attending
  end

  def accounted_for(event)
    @accounted = false
    self.rsvps.each do |r|
      if r.event_id == event.id
        if r.present == true
          @accounted = true
        end
      end
    end
    return @accounted
  end
end
