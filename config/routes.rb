Rails.application.routes.draw do
  namespace :nba_pool do
    resources :players
  end
  resources :seasons
  resources :user_teams
  resources :user_leagues
  resources :trades
  resources :trade_machines
  resources :team_seasons
  resources :leagues do
    devise_for :users
    resources :teams do
      resources :draft_picks
      resources :players do
        resources :salaries
      end
    end
  end
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "leagues#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
