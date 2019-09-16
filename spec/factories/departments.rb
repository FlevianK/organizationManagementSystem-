FactoryBot.define do
  factory :department do
    name { Faker::Name.name }
    code { Faker::Code.asin }
    total_members { Faker::Number.number(10).to_i }
  end
end