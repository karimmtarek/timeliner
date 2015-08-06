FactoryGirl.define do
  factory :milestone do
    title "Freelance Web UI Designer & Developer"
    company "Web Cream "
    company_url "http://webcream.ca"
    location "Montreal, Canada."
    date_start { 5.months.ago }
    date_end  { 1.months.ago }
    description "I talk [about](http://webcream.ca) escaping the \"golden lock\" of Java and making the leap into Ruby. Recorded during a Hashrocket book club session covering the book Apprenticeship Patterns by my friends Dave Hoover and Ade Oshineye.\r\n\r\n- Wrote a full testing suite using RSpec.\r\n- Added basic user creation/authentication system Wrote a full testing suite using RSpec.\r\n- Automated content generation on user creation."
    present false
    user_id 1
  end
end
