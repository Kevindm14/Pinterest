FactoryBot.define do
  factory :pin do
    title { Faker::Name.first_name }
    image { Faker::Lorem.word }
    user_id { nil }
  end
end
