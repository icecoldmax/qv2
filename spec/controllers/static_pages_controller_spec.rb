require "spec_helper"

describe StaticPagesController do
  describe "#home" do
    it "renders the home page" do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe "#help" do
    it "renders the help page" do
      get :help
      expect(response).to render_template(:help)
    end
  end

  describe "#setup" do
    it "renders the setup page" do
      get :setup
      expect(response).to render_template(:setup)
    end
  end

  describe "#quiz" do
    it "renders the quiz page" do
      get :quiz
      expect(response).to render_template(:quiz)
    end
  end
end
