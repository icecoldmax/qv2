class Quiz < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions, dependent: :destroy

  validates :name, :author, presence: true
end
