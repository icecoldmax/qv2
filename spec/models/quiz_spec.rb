require "spec_helper"

describe Quiz do
  it { should belong_to :user }
  it { should have_many :questions }
  it { should have_many(:answers).through(:questions) }
  it { should respond_to(:name) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
end
