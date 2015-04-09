require 'rails_helper'

describe Users::OmniauthCallbacksController do

  before do
    request.env['omniauth.auth'] = auth_mock
  end

  describe "#passthru" do
     it "creates a session" do
      post '/users/auth/linkedin', auth_mock
      expect(session[:user_id]).not_to be_nil
    end
  end
end
