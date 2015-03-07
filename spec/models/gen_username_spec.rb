require 'rails_helper'

describe "Creating a user" do
  it 'generates username' do
    user = User.create!(user_attributes)

    expect(user.username).to eq('example-user')
  end

  it 'generates a new username if existed' do
    user = User.create!(user_attributes)
    user2 = User.create!(user_attributes({email: 'user2@gmail.com'}))
    user3 = User.create!(user_attributes({email: 'user3@gmail.com'}))

    user4 = User.create!(user_attributes({email: 'user4@gmail.com', username: 'userx'}))
    user5 = User.create!(user_attributes({email: 'user5@gmail.com', username: 'userx'}))

    expect(user2.username).to eq('example-user-1')
    expect(user3.username).to eq('example-user-2')

    expect(user4.username).to eq('userx')
    expect(user5.username).to eq('userx-1')
  end
end