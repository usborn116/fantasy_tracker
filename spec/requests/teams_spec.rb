require 'rails_helper'

RSpec.describe "Teams", type: :request do
  
   describe 'GET methods' do

    context "Teams controller" do
      
      before(:each) do
        @user = create(:user)
        @user.confirm
        @league = create(:league, user: @user)
        @user2 = create(:user, email: "email2@gmail.com")
        @user2.confirm
        create(:league_membership, member: @user2, league: @league, role: "member" )
        @team = create(:team, league: @league)
        @player = create(:player, league: @league, team: @team )
        @nba_player = create(:nba_player)
        @season = create(:season, league: @league)
      end

      it 'gets /roster with search results' do
        sign_in @user
        get "/api/leagues/#{@league.id}/teams/#{@team.id}/roster", params: { last_name: "Last" }
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res['team']).to include(@team.as_json(include: [:players, :draft_picks]))
        expect(res['search_results']).to include(@nba_player.as_json)
      end

      it 'gets /roster without search results' do
        sign_in @user
        get "/api/leagues/#{@league.id}/teams/#{@team.id}/roster"
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res['team']).to include(@team.as_json(include: [:players, :draft_picks]))
        expect(res['search_results']).to eq([])
        
      end

      it 'gets /user_options with only self if not an admin' do

        sign_in @user2
        get "/api/leagues/#{@league.id}/user_options"
        res = JSON.parse(response.body)
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res).not_to include(@user.as_json)
        expect(res).to include(@user2.as_json)
       
      end

      it 'gets /user_options with all league members' do
        sign_in @user
        get "/api/leagues/#{@league.id}/user_options"
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res).to include(@user.as_json)
        expect(res).to include(@user2.as_json)
        
      end
    
    end

  end


end
