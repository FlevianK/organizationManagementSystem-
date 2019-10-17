FactoryBot.define do
  factory :leader do
    title { Faker::Name.name }
    department { Faker::Name.name }
    member_id { nil }
  end
end