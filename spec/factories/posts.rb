FactoryGirl.define do
  factory :post do
    title { Faker::Book.title }
    body { Faker::Lorem.paragraph(Random.new.rand(5)) }
    published_on { Faker::Date.backward(Random.new.rand(99)) }
    user nil
  end
end
