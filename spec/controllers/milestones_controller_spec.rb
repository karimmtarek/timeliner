require 'rails_helper'

describe MilestonesController do
  describe "create" do
    let(:user) { User.create!(user_attributes) }

    before do
      request.env['omniauth.auth'] = auth_mock
      sign_in user
    end

    it 'creates a new item' do
      milestone_params = {
        milestone: {
              title: "Freelance Front-end Developer / Web UI Designer",
              company: "Webcream",
              company_url: "http://webcream.ca",
              location: "Montreal, Canada.",
              date_start: 100.days.ago,
              date_end: Date.today,
              description: "Web development shop in Montreal.",
              user_id: user.id
            }
      }
      post :create, milestone_params
      expect(user.milestones.count).to eq(1)
      expect(response.status).to eq 302
      expect(response.headers['Location']).to eq(milestones_url)
    end
  end

end
