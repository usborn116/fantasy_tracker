class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :user_leagues
  has_many :leagues, through: :user_leagues
  has_many :user_teams
  has_many :teams, through: :user_teams



end
