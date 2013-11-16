class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :quiz

  validates :content, presence: true
  validates_inclusion_of :correct, in: [true, false]
end
