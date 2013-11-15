class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :quiz

  validates :content, :correct, presence: true
end
