FactoryGirl.define do
  factory :tweet do
    content { FFaker::Lorem.sentence(10) }
    user
  end
end
