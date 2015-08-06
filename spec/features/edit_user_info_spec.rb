require 'rails_helper'

describe 'Edit account info' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    user.confirm!
    sign_in(user)
  end

  it 'updates account information' do
    visit user_path(user)
    click_link 'Edit'

    expect(current_path).to eq(edit_user_path(user))

    fill_in 'Username', with: 'new-user-name'
    within '.stick-it-up' do
      click_button 'Update'
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_text('new-user-name')
  end
end
