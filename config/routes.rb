Rails.application.routes.draw do

  scope '/api' do

    get 'me', to: "users#show"

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
  resources :user_leagues
  resources :leagues do
    resources :trade_machines
    resources :trades
    resources :seasons
    resources :teams do
      resources :team_seasons
      resources :draft_picks
      resources :players do
        resources :salaries
      end
    end
  end
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  

  # Defines the root path route ("/")
  # root "articles#index"
end
