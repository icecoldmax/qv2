class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :quiz

  default_scope { order(:id) }

  validates :content, presence: true
  validates_inclusion_of :correct, in: [true, false]
end
