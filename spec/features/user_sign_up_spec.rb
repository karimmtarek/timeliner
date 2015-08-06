require 'rails_helper'

describe 'Sign up form' do
  context 'when valid data' do
    it 'it allows user to sign up' do
      visit root_path

      click_on 'Sign up'

      expect(page).to have_text('Sign up')

      fill_in 'user[email]', with: 'karim@gmail.com'
      fill_in 'user[username]', with: 'karim'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'

      click_on 'Sign up'

      expect(current_path).to eq(root_path)
    end
  end

  context 'when invalid data' do
    it "it doesn't allows user to sign up" do
      visit root_path

      click_on 'Sign up'

      expect(page).to have_text('Sign up')

      fill_in 'user[email]', with: 'karim_gmail.com'
      fill_in 'user[username]', with: 'ka@rim'
      fill_in 'user[password]', with: ''
      fill_in 'user[password_confirmation]', with: ''

      click_on 'Sign up'

      expect(page).to have_text('errors')
    end
  end
end
