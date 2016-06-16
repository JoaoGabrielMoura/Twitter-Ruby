FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    name { FFaker::Name.name }
    password "123456"
    password_confirmation "123456"
  end
end
