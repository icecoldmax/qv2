class Quiz < ActiveRecord::Base
  has_many :questions
  has_many :answers, through: :questions

  validates :name, :author, presence: true
end
