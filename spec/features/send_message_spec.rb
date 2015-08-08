require 'rails_helper'

describe 'Contact form' do
  let(:user) { FactoryGirl.create(:user) }
  before do
    user.confirm!
    user.update!(maintenance_mode: false)
  end

  it 'send message to a user' do
    visit timeline_path(user)

    expect(page).to have_text(user.full_name)

    fill_in 'message[email]', with: 'milestone@title.com'
    fill_in 'message[subject]', with: 'subject line!'
    fill_in 'message[body]', with: 'company name'

    click_button 'Send message'

    expect(page).to have_text("Thanks for getting in touch, I'll get back to you as soon as possible.")
  end
end
