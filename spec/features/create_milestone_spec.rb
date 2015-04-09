require 'rails_helper'


describe "Milestone" do
  let(:user) { User.create!(user_attributes) }

  xit 'Create' do
    visit user_path(user)
    expect(current_path).to eq(user_path(user))
    click_link 'Create milestone'

    expect(current_path).to eq(new_milestone_path)

    fill_in 'Title', with: "milestone title"
    fill_in 'Company', with: "company name"
    fill_in 'Company url', with: "http://company.com"
    fill_in 'Location', with: "Montreal, Canada."
    fill_in 'Description', with: "Ooooops, I did again!"
    fill_in 'Date start', with: 90.days.ago
    fill_in 'Date end', with: Date.today
    click_button 'Create'

    expect(current_path).to eq(milestones_path)
    expect(page).to have_text('milestone title')

  end
end
