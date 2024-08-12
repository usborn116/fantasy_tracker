class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :user_leagues
  has_many :leagues
  has_many :league_memberships, through: :user_leagues, class_name: "League"
  has_many :user_teams
  has_many :teams, through: :user_teams

  accepts_nested_attributes_for :user_leagues
  accepts_nested_attributes_for :user_teams
  accepts_nested_attributes_for :teams

end
