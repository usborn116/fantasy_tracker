Rails.application.routes.draw do

  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations'
    }
  namespace :nba_pool do
    resources :players
    resources :nba_api, only: :index
  end
  
  resources :user_teams
  resources :leagues do
    resources :league_memberships
    resources :trade_machines
    resources :trades
    resources :seasons do
      resources :draft_picks
    end
    resources :teams do
      resources :team_seasons
      get 'roster', to: "teams#roster"
    end
    resources :players do
      resources :salaries
    end
  end
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "nba_pool/players#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
