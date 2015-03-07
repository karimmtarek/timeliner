def user_attributes(overrides = {})
  {
    username: "example user",
    email: "user@example.com",
    password: "password",
    password_confirmation: "password"
  }.merge(overrides)
end