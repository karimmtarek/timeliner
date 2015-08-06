FactoryGirl.define do
  factory :project do
    title "HYPER RECIPES API"
    description "I talk [about](http//webcream.ca) escaping the \"golden lock\" of Java and making the leap into Ruby. Recorded during a Hashrocket book club session covering the book Apprenticeship Patterns by my friends Dave Hoover and Ade Oshineye.\r\n\r\n- Added basic user creation/authentication system Wrote a full testing suite using RSpec.\r\n- Automated content generation on user creation.\r\n- Wrote a full testing suite using RSpec\r\n- Added basic user creation/authentication system"
    client "Hyper"
    published_on { 1.months.ago }
    link_live "https://github.com"
    link_source "https://github.com/karimmtarek/todo-wiz"
    client_url "http://www.hyper.no"
    user_id 1
  end
end
