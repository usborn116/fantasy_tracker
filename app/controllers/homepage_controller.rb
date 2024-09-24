class HomepageController < ApplicationController
  before_action :set_nba_pool_player, only: %i[ show edit update destroy ]
  skip_before_action :set_league
  skip_before_action :authenticate_user!, only: %i[ index show ]

  def index
  end

end