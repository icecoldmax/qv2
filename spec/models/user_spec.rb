require "spec_helper"

describe User do
  it { should have_many :quizzes }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(50) }
  it { should ensure_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:email) }
  it { should have_secure_password }

  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  before do
    @user = User.new(name: "example user", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  describe "remember token" do
    before { @user.save }
    it "isn't blank" do
      expect(@user.remember_token).to_not be_blank
    end
  end
end
