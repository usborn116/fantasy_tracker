require 'rails_helper'

RSpec.describe "Players", type: :request do
  
   describe 'GET methods' do

    context "Players controller" do
      
      before(:each) do
        @user = create(:user)
        @user.confirm
        sign_in @user
        @league = create(:league, user: @user)
        @team = create(:team, league: @league)
        @nba_player = create(:nba_player)
        @player = create(:player, league: @league, team: @team )
        @salary = create(:salary, player: @player)
      end

      it 'gets /index for players with associated data' do
        get "/api/leagues/#{@league.id}/players"
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res).to include(@player.as_json(include: [:team, :salaries]))
      end

      it 'gets /show for player with associated data' do
        get "/api/leagues/#{@league.id}/players/#{@player.id}"
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res).to eq(@player.as_json(include: [:team, {salaries: { include: [:season, :player]}}]))
      end
    
    end

  end

  describe 'POST methods' do

    context "Players controller" do
      
      before(:each) do
        @user = create(:user)
        @user.confirm
        sign_in @user
        @league = create(:league, user: @user)
        @team = create(:team, league: @league)
        @nba_player = create(:nba_player)
      end

      let(:params) {  { nba_player_id: 123456, team_id: @team.id } }
      let(:bad_params) { { nba_player_id: 500, team_id: @team.id } }

      it 'creates a new player if they are a valid nba_player' do
        post "/api/leagues/#{@league.id}/players", params: params
        expect(response.status).to eq(201)
      end

      it 'does not create a new player if they are not a valid nba_player' do
        post "/api/leagues/#{@league.id}/players", params: bad_params
        expect(response.status).to eq(422)
      end
    
    end

  end

end
