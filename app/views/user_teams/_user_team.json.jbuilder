json.extract! user_team, :id, :user_id, :team_id, :created_at, :updated_at
json.url user_team_url(user_team, format: :json)
