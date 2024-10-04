FactoryBot.define do
  factory :league, class: "League" do
    name { 'League 1' }
    #association :user, factory: :user
  end
end