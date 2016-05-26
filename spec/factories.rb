include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password" 
  end

end