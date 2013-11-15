require "spec_helper"

describe QuizzesController do
  render_views

  let(:quiz) { FactoryGirl.create(:quiz) }

  describe "#index" do
    it "renders the index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#new" do
    it "renders the new page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    let(:quiz_attributes) { FactoryGirl.attributes_for(:quiz) }

    context "quiz has correct attributes" do
      it "creates a quiz" do
        expect do
          post :create, quiz: quiz_attributes
        end.to change(Quiz, :count).by 1
      end

      it "redirects to index" do
        post :create, quiz: quiz_attributes
        expect(response).to redirect_to(quizzes_path)
      end
    end

    context "quiz has incorrect attribs" do
      it "renders new" do
        post :create, quiz: { name: "" }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "#edit" do
    it "renders the edit page" do
      get :edit, :id => quiz.id
      expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    let(:quiz_attributes) { { name: "Different Name", author: "Chi" } }

    it "updates the quiz" do
      put :update, id: quiz.id, quiz: quiz_attributes
      quiz.reload
      expect(quiz.name).to eq "Different Name"
    end

    it "redirects to show" do
      put :update, id: quiz.id, quiz: quiz_attributes
      expect(response).to redirect_to(quiz_path(quiz.id))
    end
  end

  describe "#destroy" do
    let!(:quiz) { FactoryGirl.create(:quiz) }

    it "deletes the quiz" do
      expect do
        delete :destroy, id: quiz.id
      end.to change(Quiz, :count).by(-1)
    end

    it "redirects to index" do
      delete :destroy, id: quiz.id
      expect(response).to redirect_to(quizzes_path)
    end
  end
end
