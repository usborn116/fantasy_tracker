FactoryBot.define do
  factory :player, class: "Player" do
    nba_id { 1234 }
    #association :league, factory: :league
    #association :team, factory: :team
  end
end