Rails.application.routes.draw do
  namespace :nba_pool do
    resources :players
  end
  
  resources :user_teams
  resources :user_leagues
  resources :leagues do
    resources :trade_machines
    resources :trades
    resources :seasons
    devise_for :users
    resources :teams do
      resources :team_seasons
      resources :draft_picks
      resources :players do
        resources :salaries
      end
    end
  end
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "nba_pool/players#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
