class LeagueMembership < ApplicationRecord
  belongs_to :member, class_name: "User"
  belongs_to :league
end
