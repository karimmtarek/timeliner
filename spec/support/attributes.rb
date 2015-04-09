def user_attributes(overrides = {})
  {
    username: "example user",
    email: "user@example.com",
    password: "password",
    password_confirmation: "password",
    uid: '123545'
  }.merge(overrides)
end

def milestone_attributes(overrides = {})
  {
    title: "Freelance Front-end Developer / Web UI Designer",
     company: "Webcream",
     company_url: "http://webcream.ca",
     location: "Montreal, Canada.",
     date_start: 100.days.ago,
     date_end: Date.today,
     description: "Web development shop in Montreal."
  }
end
