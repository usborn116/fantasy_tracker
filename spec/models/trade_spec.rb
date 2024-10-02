require 'rails_helper'

RSpec.describe Trade, type: :model do
  before(:context) do
    @league = League.first
    @team1 = @league.teams.create!
    @team2 = @league.teams.create!
    @season = @league.seasons.create!
  end

  context 'status is set upon creation' do
    it 'sets the status to pending' do
      trade = @league.trades.create!(team1_id: @team1.id, team2_id: @team2.id, season_id: @season.id)
      expect(trade.status).to eq("pending")
    end

  end
end