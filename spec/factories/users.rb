FactoryGirl.define do
  factory :user do
    name "username"
    email "valid@email.com"
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end
