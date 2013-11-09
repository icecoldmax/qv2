class Quiz < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions, dependent: :destroy

  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: proc { |attributes| attributes["content"].blank? }

  validates :name, :author, presence: true
end
