FactoryBot.define do
  factory :opportunity do
    title { "Ruby on Rails developer" }
    description { "Lorem ipsum dolor sit amet." }
    salary { 100000 }
    client
  end
end
