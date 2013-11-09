class Answer < ActiveRecord::Base
  belongs_to :question

  validates :content, :correct, presence: true
end
