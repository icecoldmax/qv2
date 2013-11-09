require "spec_helper"

describe QuestionsController do
  render_views
  let(:quiz) { FactoryGirl.create(:quiz) }
  let(:question) { FactoryGirl.create(:question, quiz: quiz) }

  describe "#index" do
    it "renders the index page" do
      get :index, quiz_id: quiz.id
      expect(response).to render_template(:index)
    end
  end

  describe "#new" do
    it "renders the new page" do
      get :new, quiz_id: quiz.id
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    let(:question_attributes) { FactoryGirl.attributes_for(:question) }

    context "question has correct attributes" do
      it "creates a question" do
        expect do
          post :create, quiz_id: quiz.id, question: question_attributes
        end.to change(Question, :count).by 1
      end

      it "redirects to index" do
        post :create, quiz_id: quiz.id, question: question_attributes
        expect(response).to redirect_to(quiz_questions_path)
      end
    end

    context "question has incorrect attribs" do
      it "renders new" do
        post :create, quiz_id: quiz.id, question: {}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "#edit" do
    it "renders the edit page" do
      get :edit, quiz_id: quiz.id, id: question.id
      expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    let(:question_attributes) { { content: "Different Name" } }

    it "updates the question" do
      put :update, id: question.id, quiz_id: quiz.id, question: question_attributes
      question.reload
      expect(question.content).to eq "Different Name"
    end

    it "redirects to show" do
      put :update, id: question.id, quiz_id: quiz.id, question: question_attributes
      expect(response).to redirect_to(quiz_question_path(quiz.id, question.id))
    end
  end

  describe "#destroy" do
    let!(:question) { FactoryGirl.create(:question) }

    it "deletes the question" do
      expect do
        delete :destroy, id: question.id, quiz_id: quiz.id
      end.to change(Question, :count).by(-1)
    end

    it "redirects to index" do
      delete :destroy, id: question.id, quiz_id: quiz.id
      expect(response).to redirect_to(quiz_questions_path)
    end
  end
end
