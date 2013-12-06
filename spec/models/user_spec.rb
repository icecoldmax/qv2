require "spec_helper"

describe User do
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(50) }
  it { should ensure_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:email) }
  it { should have_secure_password }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
end
