class NbaPool::Player < ApplicationRecord
  validates :nba_id, uniqueness: true
end
