class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice

  validate :user_has_not_answered
  def user_has_not_answered
    errors.add(:user, 'has already answered') if user.answered_for? choice.poll
  end
end
