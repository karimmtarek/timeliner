FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name  'Doe'
    username 'john-doe'
    email 'john_doe@gmail.com'
    password 'password'
  end
end
