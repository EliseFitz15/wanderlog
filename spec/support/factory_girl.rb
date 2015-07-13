require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name "Charlotte"
    sequence(:email) {|n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

end
