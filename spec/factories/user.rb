FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name  'Doe'
    username 'john-doe'
    email 'john_doe@example.com'
    password 'password'

    trait :confirmed do
      confirmed_at 1.day.ago
    end

    trait :published do
      maintenance_mode false
    end
  end
end
