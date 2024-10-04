require 'rails_helper'

RSpec.describe "TeamSeasons", type: :request do
  
   describe 'GET methods' do

    context "Team Seasons controller" do
      
      before(:each) do
        @user = create(:user)
        @user.confirm
        sign_in @user
        @league = create(:league, user: @user)
        @team = create(:team, league: @league)
        @season = create(:season, league: @league)
        @team_season = create(:team_season, team: @team, season: @season)
      end

      it 'gets /index for team_seasons with associated data' do
        get "/api/leagues/#{@league.id}/teams/#{@team.id}/team_seasons"
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res).to include(@team_season.as_json(include: :season))
      end

      it 'gets /show for team_season with associated data' do
        get "/api/leagues/#{@league.id}/teams/#{@team.id}/team_seasons/#{@team_season.id}"
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res).to eq(@team_season.as_json(include: :season))
      end
    end

  end

end
