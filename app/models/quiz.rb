class Quiz < ActiveRecord::Base
  validates :name, :author, presence: true
end
