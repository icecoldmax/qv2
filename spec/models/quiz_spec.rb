require "spec_helper"

describe Quiz do
  let(:quiz) { Quiz.new(name: "First Quiz", author: "Dave") }

  subject { quiz }

  it { should have_many :questions }
  it { should have_many(:answers).through(:questions) }
  it { should respond_to(:name) }
  it { should respond_to(:author) }
  it { should be_valid }

  describe "when name is not present" do
    let(:quiz) { Quiz.new(name: "", author: "Dave") }

    it { should_not be_valid }
  end
end
