require 'rails_helper'

describe "Contact form" do
  it 'send message to a user' do

    user = User.create!(user_attributes)

    visit user_timelines_path(user)

    expect(current_path).to eq(user_timelines_path(user))

    fill_in 'message[email]', with: "milestone@title.com"
    fill_in 'message[body]', with: "company name"

    click_button 'Send message'

    expect(page).to have_text("Thanks for getting in touch, I'll get back to you as soon as possible.")

  end
end