class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers

  validates :content, presence: true
end
