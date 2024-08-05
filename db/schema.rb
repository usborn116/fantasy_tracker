# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_08_05_235342) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "draft_picks", force: :cascade do |t|
    t.integer "year"
    t.integer "round"
    t.integer "pick"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id", null: false
    t.bigint "original_owner_id"
    t.bigint "team_season_id"
    t.index ["original_owner_id"], name: "index_draft_picks_on_original_owner_id"
    t.index ["team_id"], name: "index_draft_picks_on_team_id"
    t.index ["team_season_id"], name: "index_draft_picks_on_team_season_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.integer "league_id"
    t.string "name"
    t.integer "current_start_year"
    t.integer "current_end_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.integer "nba_id"
    t.string "slug"
    t.integer "draft_year"
    t.boolean "trade_block"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.string "nba_team"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.integer "value"
    t.boolean "free_agent"
    t.boolean "waiver_acquisition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id", null: false
    t.bigint "team_season_id"
    t.index ["player_id"], name: "index_salaries_on_player_id"
    t.index ["team_season_id"], name: "index_salaries_on_team_season_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.integer "start_year"
    t.integer "end_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_seasons_on_league_id"
  end

  create_table "team_seasons", force: :cascade do |t|
    t.integer "soft_cap"
    t.integer "hard_cap"
    t.integer "roster_size"
    t.integer "max_RFA_bid"
    t.integer "max_UFA_bid"
    t.integer "dead_cap"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id", null: false
    t.integer "year"
    t.bigint "season_id"
    t.index ["season_id"], name: "index_team_seasons_on_season_id"
    t.index ["team_id"], name: "index_team_seasons_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "league_id", null: false
    t.index ["league_id"], name: "index_teams_on_league_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "trades", force: :cascade do |t|
    t.bigint "team1_id"
    t.bigint "team2_id"
    t.string "outgoing"
    t.string "incoming"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_season_id", null: false
    t.bigint "league_id"
    t.string "status"
    t.index ["league_id"], name: "index_trades_on_league_id"
    t.index ["team1_id"], name: "index_trades_on_team1_id"
    t.index ["team2_id"], name: "index_trades_on_team2_id"
    t.index ["team_season_id"], name: "index_trades_on_team_season_id"
  end

  create_table "user_leagues", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["league_id"], name: "index_user_leagues_on_league_id"
    t.index ["user_id"], name: "index_user_leagues_on_user_id"
  end

  create_table "user_teams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_user_teams_on_team_id"
    t.index ["user_id"], name: "index_user_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "draft_picks", "team_seasons"
  add_foreign_key "draft_picks", "teams"
  add_foreign_key "draft_picks", "teams", column: "original_owner_id"
  add_foreign_key "players", "teams"
  add_foreign_key "salaries", "players"
  add_foreign_key "salaries", "team_seasons"
  add_foreign_key "seasons", "leagues"
  add_foreign_key "team_seasons", "seasons"
  add_foreign_key "team_seasons", "teams"
  add_foreign_key "teams", "leagues"
  add_foreign_key "teams", "users"
  add_foreign_key "trades", "leagues"
  add_foreign_key "trades", "team_seasons"
  add_foreign_key "trades", "teams", column: "team1_id"
  add_foreign_key "trades", "teams", column: "team2_id"
  add_foreign_key "user_leagues", "leagues"
  add_foreign_key "user_leagues", "users"
  add_foreign_key "user_teams", "teams"
  add_foreign_key "user_teams", "users"
end
