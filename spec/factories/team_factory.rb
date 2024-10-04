FactoryBot.define do
  factory :team, class: "Team" do
    name { 'Team' }
    #association :league, factory: :league
  end
end