require 'rails_helper'

describe "Milestone" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    user.confirm!
    sign_in(user)
  end

  it 'Create' do
    visit user_path(user)
    expect(current_path).to eq(user_path(user))

    click_on 'Milestone'
    expect(current_path).to eq(new_milestone_path)

    fill_in 'Title', with: "milestone title"
    fill_in 'Company', with: "company name"
    fill_in 'Company url', with: "http://company.com"
    fill_in 'Location', with: "Montreal, Canada."
    fill_in 'Description', with: "Ooooops, I did again!"
    fill_in 'milestone[date_start]', with: 90.days.ago
    fill_in 'milestone[date_end]', with: Date.today
    within '.stick-it-up' do
      click_button('Create')
    end

    expect(current_path).to eq(milestones_path)
    expect(page).to have_text('milestone title')

    click_on 'Delete'

    expect(page).to have_text('Milestone destroy')
  end
end
