FactoryBot.define do
  factory :salary, class: "Salary" do
    value { 30 }
    #association :league, factory: :league
    #association :team, factory: :team
  end
end