FactoryBot.define do
  factory :service do
    service_date { Faker::Date.backward(90) }
    total_new_converts { Faker::Number.number }
    total_attendants { Faker::Number.number }
    sunday_school_teachers { Faker::Lorem.sentences }
  end
end