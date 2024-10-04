require 'rails_helper'

RSpec.describe "Trades", type: :request do
  
   describe 'GET methods' do

    context "Trades controller" do
      
      before(:each) do
        @user = create(:user)
        @user.confirm
        @league = create(:league, user: @user)
        @user2 = create(:user, email: "email2@gmail.com")
        @user2.confirm
        @user3 = create(:user, email: "email3@gmail.com")
        @user3.confirm
        @season = create(:season, league: @league)
        @team1 = @user.teams.create(league: @league)
        @team2 = @user2.teams.create(league: @league)
        @team3 = @user3.teams.create(league: @league)
        @trade1 = create(:trade, league: @league, season: @season, team1: @team1, team2: @team2)
        @trade2 = create(:trade, league: @league, season: @season, team1: @team2, team2: @team3)
      end

      it 'gets all trades for admin' do
        sign_in @user
        get "/api/leagues/#{@league.id}/trades"
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res).to include(@trade1.as_json)
        expect(res).to include(@trade2.as_json)
      end

      it 'gets only one trade for non-admin' do
        sign_in @user3
        get "/api/leagues/#{@league.id}/trades"
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res).not_to include(@trade1.as_json)
        expect(res).to include(@trade2.as_json)
      end
    
    end

  end


end
