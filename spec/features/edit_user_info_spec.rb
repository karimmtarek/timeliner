require 'rails_helper'

describe "Edit user info" do
  it 'updates user information' do

    user = User.create!(user_attributes)
    sign_in(user)

    visit information_path(user)
    expect(current_path).to eq(information_path(user))

    click_link 'Edit'
    expect(current_path).to eq(edit_information_path(user))

    expect(page).to have_content(user.username)
    # expect(find_field('username').value).to eq(user.username)

  end
end