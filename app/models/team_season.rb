class TeamSeason < ApplicationRecord
    belongs_to :team
    belongs_to :season, optional: true

    def year
      self.season.start_year
    end

    def roster_size
      self.team.players.count
    end

    def soft_cap_room
      self.season.base_cap - self.team.salaries.where(season_id: self.season_id).sum(&:value)
    end

    def hard_cap_room
      self.season.base_cap + 10 - self.team.salaries.where(season_id: self.season_id).sum(&:value)
    end

    def max_RFA_bid
      self.hard_cap_room
    end

    def max_UFA_bid
      self.soft_cap_room
    end

    def incoming_picks
      self.team.draft_picks.where(season_id: self.season.id).count
    end

    def dead_cap
      self.team.salaries.where(season_id: self.season_id).where(waived: true).sum(&:value)
    end

end
