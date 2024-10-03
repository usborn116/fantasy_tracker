require 'rails_helper'

RSpec.describe "Leagues", type: :request do

  context "Leagues controller" do
    
    before(:each) do
      @user = User.find_or_create_by(email: 'user_email@email.com')
      @user.update!(name:'Usertest', encrypted_password:'userpassword', password: 'userpassword')
      @user.confirm
      sign_in @user
      @league = @user.owned_leagues.find_or_create_by(name: 'League 1')
    end

    it 'gets /index for leagues with teams' do
      get '/api/leagues'
      expect(response.status).to eq(200)
      res = JSON.parse(response.body)
      expect(res).to include(@league.as_json(include: :teams))
    end

    it 'gets /show for league with teams' do
      get "/api/leagues/#{@league.id}"
      res = JSON.parse(response.body)
      expect(res).to eq(@league.as_json(include: :teams))
    end

    it 'gets /members for league' do
      get "/api/leagues/#{@league.id}/members"
      res = JSON.parse(response.body)
      expect(res).to include(@user.as_json)
    end
   
  end
end
