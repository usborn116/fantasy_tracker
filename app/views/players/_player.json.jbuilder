json.extract! player, :id, :first_name, :last_name, :position, :nba_id, :slug, :draft_year, :trade_block, :created_at, :updated_at
json.url player_url(player, format: :json)
