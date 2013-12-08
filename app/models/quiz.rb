class Quiz < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :questions, :answers, allow_destroy: true

  validates :name, :user_id, presence: true
end
