class League < ApplicationRecord
    has_many :teams, dependent: :destroy
    has_many :user_leagues, dependent: :destroy
    has_many :users, through: :user_leagues
    has_many :trades, dependent: :destroy
    has_many :seasons, dependent: :destroy

    accepts_nested_attributes_for :seasons
    accepts_nested_attributes_for :user_leagues

    after_create :set_admin

    private

    def admins
      self.users.where(role: "admin")
    end

    def set_admin
      self.user_leagues.where(user_id: current_user.id).each do |ul|
        ul.update!(role: "admin")
      end
    end

end
