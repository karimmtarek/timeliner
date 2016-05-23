FactoryGirl.define do
  factory :milestone do
    title { Faker::Name.title }
    company { Faker::Company.name }
    company_url { Faker::Internet.url }
    location { Faker::Address.country }
    date_start { Faker::Date.backward(Random.new.rand(99)) }
    date_end  { Faker::Date.backward(Random.new.rand(10)) }
    description { Faker::Lorem.paragraph }
    present false
    user_id nil
  end
end
