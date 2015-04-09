require 'rails_helper'

describe MilestonesController do
  include Capybara::DSL
  describe "create" do
    let(:user) { User.create!(user_attributes) }

    before do
      request.env['omniauth.auth'] = auth_mock
      # user = double('user')
      allow(request.env['warden']).to receive(:authenticate!) { user }
      allow(controller).to receive(:current_user) { user }
    end

    it 'creates a new item' do
      milestone_params = { milestone: {
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

      expect(response.status).to eq :created
      # expect(current_path).to eq(milestones_path)
      # expect(page).to have_text(milestone_params['title'])
    end
  end

end
