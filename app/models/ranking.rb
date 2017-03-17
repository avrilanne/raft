class Ranking < ActiveRecord::Base
  belongs_to :option
  belongs_to :voter, foreign_key: :user_id, source: "User"

  validates :option_id, :user_id, presence: true
end
