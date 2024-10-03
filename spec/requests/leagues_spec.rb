require 'rails_helper'

RSpec.describe "Leagues", type: :request do
  describe "GET /index" do

    it 'gets leagues' do
      @user = User.find_or_create_by(email: 'user_email@email.com')
      @user.update!(name:'Usertest', encrypted_password:'userpassword', password: 'userpassword')
      @user.confirm
      sign_in @user
      @league = @user.owned_leagues.create(name: 'League 1')
      get '/api/leagues'
      expect(response.status).to eq(200)
      res = JSON.parse(response.body)
      expect(res).to include(@league.as_json)
    end
   
  end
end
