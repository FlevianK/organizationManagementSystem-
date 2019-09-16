FactoryBot.define do
  factory :member do
    name { Faker::Name.name }
    contacts { Faker::Number.digit }
    residence { Faker::Name.name }
    join_date { Faker::Date.backward(1000) }
    born_again true
    spirit_filled true
    departments  { Faker::Lorem.word }
  end
end