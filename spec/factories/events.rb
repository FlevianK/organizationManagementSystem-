FactoryBot.define do
  factory :event do
    department { Faker::Name.name }
    event_name { Faker::Lorem.sentence }
    event_date { Faker::Name..forward(362) }
    event_description { Faker::Lorem.paragraph }
    event_guest { Faker::Lorem.sentences }
    event_venue { Faker::Lorem.sentences }
  end
end