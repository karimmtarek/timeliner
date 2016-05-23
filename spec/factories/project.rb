FactoryGirl.define do
  factory :project do
    title { Faker::Company.catch_phrase }
    description { Faker::Lorem.paragraph }
    client { Faker::Company.name }
    published_on { Faker::Date.backward(Random.new.rand(99)) }
    link_live { Faker::Internet.url }
    link_source { Faker::Internet.url }
    client_url { Faker::Internet.url }
    user_id nil
  end
end
