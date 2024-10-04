require 'rails_helper'

RSpec.describe "NbaApis", type: :request do
  describe "GET /index" do

    it "runs the API fetch and returns the success response" do
      @user = create(:user)
      @user.confirm
      sign_in @user
      get '/api/nba_pool/nba_api'
      expect(JSON.parse(response.body)['message']).to match("Successfully fetched NBA Player data")
    end
    
  end

end
