require 'rails_helper'

RSpec.describe League, type: :model do
  before(:context) do
    @user1 = User.find_or_create_by(email: 'user_email@email.com')
    @user1.update!(name:'Usertest', encrypted_password:'userpassword', password: 'userpassword')
    @user2 = User.find_or_create_by(email: 'user_email2@email.com')
    @user2.update!(name:'Usertest2', encrypted_password:'userpassword2', password: 'userpassword2')
    @user1.skip_confirmation!
    @user2.skip_confirmation!
    @user1.save!
    @user2.save!
    @league = @user1.owned_leagues.last || @user1.owned_leagues.create!
    @league.league_memberships.create!(league_id: @league.id, member_id: @user2.id, role: "member")
  end

  context 'find league admins' do
    it 'correct users are found in league admins' do
      admins = @league.admins.to_a
      expect(admins).to include(@user1)
      expect(admins).not_to include(@user2)
    end

  end
end