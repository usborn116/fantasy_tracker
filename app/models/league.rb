class League < ApplicationRecord
    has_many :teams, dependent: :destroy
    has_many :league_memberships, dependent: :destroy
    has_many :members, through: :league_memberships, class_name: "User"
    has_many :trades, dependent: :destroy
    has_many :seasons, dependent: :destroy
    has_many :players, dependent: :destroy

    accepts_nested_attributes_for :seasons
    accepts_nested_attributes_for :league_memberships

    after_create :create_admin_membership

    def admins
      self.league_memberships
      .where(role: "admin")
      .map(&:member)
    end

    private

    def create_admin_membership
      LeagueMembership.create!(member_id: self.user_id, league_id: self.id, role: "admin")
    end

end
