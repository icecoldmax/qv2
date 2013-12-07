require "spec_helper"

describe UsersController do
  render_views

  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    let(:user_attributes) { FactoryGirl.attributes_for(:user, email: "new@email.com") }

    context "valid attribs" do
      it "creates a user" do
        expect do
          post :create, user: user_attributes
        end.to change(User, :count).by 1
      end
    end

    context "user has incorrect attribs" do
      it "renders new" do
        post :create, user: { name: "" }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "#show" do
    it "renders the show template" do
      get :show, id: user.id
      expect(response).to render_template(:show)
    end
  end

  describe "#edit" do
    it "renders the edit template" do
      get :edit, id: user.id
      expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    let(:user_attributes) { { name: "diff name", email: "diff@email.com", password: "foobar2", password_confirmation: "foobar2" } }

    it "updates a user" do
      put :update, id: user.id, user: user_attributes
      user.reload
      expect(user.name).to eq "diff name"
    end
  end

  describe "#destroy" do
    let(:admin) { FactoryGirl.create(:admin, email: "admin@admin.com") }
    let!(:user) { FactoryGirl.create(:user, email: "diff@diff.com") }

    before do
      sign_in admin
    end

    it "destroys a user" do
      expect do
        delete :destroy, id: user.id
      end.to change(User, :count).by(-1)
    end
  end
end
