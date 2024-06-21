Rails.application.routes.draw do
  devise_for :users
  resources :trades
  resources :trade_machines
  resources :team_seasons
  resources :leagues
  resources :teams
  resources :draft_picks
  resources :salaries
  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "leagues#index"


  # Defines the root path route ("/")
  # root "articles#index"
end
