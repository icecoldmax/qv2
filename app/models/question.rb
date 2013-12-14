class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers

  default_scope { order(:id) }

  validates :content, presence: true
  validate :one_correct_answer

  accepts_nested_attributes_for :answers, allow_destroy: true

  def one_correct_answer
    correct_answers_count = answers.map(&:attributes).select{ |aa| aa["correct"] == true }.count

    if correct_answers_count > 1
      self.errors[:base] << "Can only have 1 correct answer per question."
    end
  end
end
