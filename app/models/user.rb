class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :league_memberships, foreign_key: :member_id
  has_many :owned_leagues, class_name: "League"
  has_many :leagues, through: :league_memberships, class_name: "League", foreign_key: :member_id
  has_many :user_teams
  has_many :teams, through: :user_teams

  accepts_nested_attributes_for :league_memberships
  accepts_nested_attributes_for :user_teams
  accepts_nested_attributes_for :teams

end
