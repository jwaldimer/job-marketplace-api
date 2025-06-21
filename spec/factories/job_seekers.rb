FactoryBot.define do
  factory :job_seeker do
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
  end
end
