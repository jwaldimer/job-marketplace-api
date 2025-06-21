FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
  end
end
