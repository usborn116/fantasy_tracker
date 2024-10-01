class NbaPool::NbaApiController < ApplicationController
  before_action :set_nba_pool_player, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_league_admin
  skip_before_action :set_league
  include NBAPlayerAPI

  def index
    players_from_api = NBAPlayerAPI.get_player_data("#{Time.now.year}-#{(Time.now.year + 1).to_s[-2..-1]}")
    players_from_api.each do |player|
      new_player = NbaPool::Player.find_or_create_by(nba_id: player.nba_id)
      new_player.update!(
        first_name: player.first_name,
        last_name: player.last_name,
        position: player.position,
        slug: player.slug,
        draft_year: player.drafted_year,
        nba_team: player.current_team
      )
    end
    redirect_back(fallback_location: '/')
  end
end
