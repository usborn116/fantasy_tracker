FactoryBot.define do
  factory :nba_player, class: "NbaPool::Player" do
    first_name { 'Player' }
    last_name { 'Last' }
    nba_id { 123456 }
  end
end