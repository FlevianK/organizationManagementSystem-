FactoryBot.define do
  factory :department do
    name { Faker::Name.name }
    code { Faker::Code.asin }
    total_member { Faker::Number.number }
  end
end