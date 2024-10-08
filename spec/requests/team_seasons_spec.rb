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
        @season = create(:season, league: @league, base_cap: 100)
        @team_season = create(:team_season, team: @team, season: @season)
      end

      it 'gets /index for team_seasons with associated data' do
        get "/api/leagues/#{@league.id}/teams/#{@team.id}/team_seasons"
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        ts = @team_season
        t = @team_season.as_json(include: [:season, :team])
        t['roster_size'] = ts.roster_size
        t['soft_cap_room'] = ts.soft_cap_room
        t['hard_cap_room'] = ts.hard_cap_room
        t['max_RFA_bid'] = ts.max_RFA_bid
        t['max_UFA_bid'] = ts.max_UFA_bid
        t['incoming_picks'] = ts.incoming_picks
        t['dead_cap'] = ts.dead_cap
        expect(res).to include(t)
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
