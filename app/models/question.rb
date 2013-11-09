class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers

  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: proc { |attributes| attributes["content"].blank? }
end
