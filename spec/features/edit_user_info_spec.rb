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
    fill_in 'Description', with: 'Full-stack Ruby on Rails developer / UI designer'
    fill_in 'Bio', with: "I'm a full stack Ruby on Rails web developer / UI designer, a problem solver who always loves a challenge and enjoys working on precise & detailed projects."
    within '.stick-it-up' do
      click_button 'Update'
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_text('new-user-name')
    expect(page).to have_text('Full-stack Ruby on Rails developer / UI designer')

    within 'header' do
      click_link 'sign-out'
    end

    expect(current_path).to eq(root_path)

    visit timeline_path(user)

    expect(page).to have_text('This timeline is in maintenance mode')

    sign_in(user)
    visit user_path(user)
    click_link 'status-switch'
    sign_out

    visit timeline_path(user)
    expect(page).to have_text(user.full_name)
  end
end
