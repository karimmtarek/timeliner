require 'rails_helper'

describe "Edit account info" do
  it 'updates account information' do

    user = User.create!(user_attributes)
    sign_in(user)

    visit user_path(user)
    expect(current_path).to eq(user_path(user))
    click_link 'Edit'

    expect(current_path).to eq(edit_user_path(user))
    expect(find_field('Username').value).to eq(user.username)
    fill_in 'Username', with: "new_user_name"
    click_button 'Update'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_text('new_user_name')

  end
end