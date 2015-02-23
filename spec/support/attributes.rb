def user_attributes(overrides = {})
  {
    username: "exampleuser",
    email: "user@example.com",
    password: "password",
    password_confirmation: "password"
  }.merge(overrides)
end