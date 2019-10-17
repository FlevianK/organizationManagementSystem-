FactoryBot.define do
  factory :tithe do
    name { Faker::Name.name }
    contacts { Faker::Number.digit }
    amount { Faker::Number.number }
    tithe_date { Faker::Date.backward(360) }
    member { true }
  end
end