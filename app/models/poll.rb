class Poll < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :choices, dependent: :destroy
  has_many :answers, through: :choices
  validates_presence_of :question, :choices

  accepts_nested_attributes_for :choices, :reject_if => :all_blank, :allow_destroy => true

  def normalized_answers_for(choice)
    answers_summary == 0 ? 0 : (choice.answers.count.to_f / answers_summary) * 100
  end

  def answers_summary
    choices.inject(0) {|summary, choice| summary + choice.answers.count}
  end

  def winning_answer

  end

  def self.active
    where("created_at <= ? AND expires >= ? AND active = ?", Time.now, Time.now, true)
  end

  def self.inactive
    where("created_at <= ? AND expires >= ? AND active = ?", Time.now, Time.now, false)
  end

  def self.expired
    where("created_at <= ? AND expires <= ?", Time.now, Time.now)
  end

end
