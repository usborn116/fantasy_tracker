require 'rails_helper'

RSpec.describe TeamSeason, type: :model do
  before(:context) do
    NbaPool::Player.find_or_create_by(nba_id: 1)
    NbaPool::Player.find_or_create_by(nba_id: 2)
    @league = League.first
    @season = Season.create!(league_id: @league.id, start_year: 2024, end_year: 2025, base_cap: 100)
    @team = Team.create!(league_id: @league.id)
    @player1 = Player.find_or_create_by(nba_id: 1)
    @player1.update!(team_id: @team.id, league_id: @league.id)
    @player2 = Player.find_or_create_by(nba_id: 2)
    @player2.update!(team_id: @team.id, league_id: @league.id)
    [@player1, @player2].each(&:save!)
    @salary1 = @player1.salaries.create!(season_id: @season.id, value: 50)
    @salary2 = @player2.salaries.create!(season_id: @season.id, value: 20, waived: true)
    @team_season = TeamSeason.create!(season_id: @season.id, team_id: @team.id)
    @df1 = @team.original_draft_picks.create!(season_id: @season.id)
    @df2 = @team.original_draft_picks.create!(season_id: @season.id)
  end

  context 'returns values for all calculated methods' do
    it 'returns year' do
      expect(@team_season.year).to be(2024)
    end

    it 'returns roster_size' do
      expect(@team_season.roster_size).to be(2)
    end

    it 'returns soft_cap_room' do
      expect(@team_season.soft_cap_room).to be(30)
    end

    it 'returns hard_cap_room' do
      expect(@team_season.hard_cap_room).to be(40)
    end

    it 'returns max_RFA_bid' do
      expect(@team_season.max_RFA_bid).to be(40)
    end

    it 'returns max_UFA_bid' do
      expect(@team_season.max_UFA_bid).to be(30)
    end

    it 'returns incoming_picks' do
      expect(@team_season.incoming_picks).to be(2)
    end

    it 'returns dead_cap' do
      expect(@team_season.dead_cap).to be(20)
    end

  end
end