require 'rails_helper'

RSpec.describe "Leagues", type: :request do

  describe 'GET methods' do

    context "Leagues controller" do
      
      before(:each) do
        @user = create(:user)
        @user.confirm
        sign_in @user
        @league = create(:league, user: @user)
      end

      it 'gets /index for leagues with teams' do
        get '/api/leagues'
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res.first.keys.sort).to eq(['teams', 'members', 'id', 'league_id', 'name'].sort)
      end

      it 'gets /show for league with teams' do
        get "/api/leagues/#{@league.id}"
        res = JSON.parse(response.body)
        expect(res).to eq(@league.as_json(include: :teams))
      end

      it 'gets /members for league' do
        get "/api/leagues/#{@league.id}/members"
        res = JSON.parse(response.body)
        expect(res).to include(@user.as_json(include: :teams))
      end
    
    end

  end
end
