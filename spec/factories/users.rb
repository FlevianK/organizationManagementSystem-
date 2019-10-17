FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'user@org.com' }
    password { 'userorg' }
  end
end