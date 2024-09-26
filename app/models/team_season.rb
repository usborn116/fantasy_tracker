class TeamSeason < ApplicationRecord
    belongs_to :team
    belongs_to :season, optional: true

    def year
      self.season.start_year
    end

    def roster_size
      self.team.players.count
    end

    def soft_cap
      
    end

    def hard_cap
      
    end

    def max_RFA_bid
      
    end

    def max_UFA_bid
      
    end

    def incoming_picks
      
    end

    def dead_cap
      
    end

end
