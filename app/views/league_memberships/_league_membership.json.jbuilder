json.extract! league_membership, :id, :member_id, :league_id, :created_at, :updated_at
json.url league_membership_url(league_membership, format: :json)
