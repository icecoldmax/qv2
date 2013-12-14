require "spec_helper"

describe Question do
  it { should belong_to(:quiz) }
  it { should have_many(:answers) }

  it { should validate_presence_of :content }

  describe "#one_correct_answer" do
    let(:user) { FactoryGirl.create(:user) }
    let(:quiz) { Quiz.new(name: "Quiz", user: user, questions_attributes: { "0" => { content: "first q", answers_attributes: answers_attributes } } ) }

    context "too many correct answers" do 
      let(:answers_attributes) { { "0" => { content: "a1", correct: true }, "1" => { content: "a2", correct: true }, "2" => { content: "a3", correct: true }, "3" => { content: "a4", correct: true } } }

      it "should not be valid" do
        expect(quiz).to_not be_valid
      end
    end

    context "just one correct answer" do
      let(:answers_attributes) { { "0" => { content: "a1", correct: false }, "1" => { content: "a2", correct: false }, "2" => { content: "a3", correct: false }, "3" => { content: "a4", correct: true } } }

      it "should be valid" do
        expect(quiz).to be_valid
      end
    end
  end
end
