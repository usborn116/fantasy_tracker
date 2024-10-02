require 'rails_helper'

RSpec.describe Player, type: :model do
  before(:context) do
    NbaPool::Player.find_or_create_by(nba_id: 1234)
    @user = User.last || User.new(name:'Usertest', email: 'user_email@email.com', password:'userpassword')
    @user.skip_confirmation!
    @user.save
    @league = @user.owned_leagues.last || @user.owned_leagues.create!
  end

  context 'a player is created' do
    it 'fails if the player is not in the NBA pool' do
      player = @league.players.new(nba_id: 123)
      expect(player.save).to be(false)
      expect(player.errors[:player]).to eq(["has to be in the NBA"])
    end

    it 'succeeds if the player is in the NBA pool' do
      player = @league.players.new(nba_id: 1234)
      expect(player.save!).to be(true)
    end
  end
end