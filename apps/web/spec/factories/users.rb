FactoryBot.define do
  factory :user do
    sequence(:mail) { |n| "MyText#{n}" }
    sequence(:user_name) { |n| "MyText#{n}" }
    password { "MyString" }
  end
end
