class Option < ActiveRecord::Base
  belongs_to :question
  has_many :rankings

  validates :question_id, :op_content, presence: true
end
