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
      resources :players, only: [:index, :show]
      resources :nba_api, only: :index
    end
    
    resources :user_teams, only: [:index]
    resources :leagues, except: [:new, :edit] do
      get 'members', to: "leagues#members"
      resources :league_memberships, except: [:new, :edit]
      resources :trade_machines, except: [:new, :edit]
      resources :trades, except: [:new, :edit]
      resources :seasons, except: [:new, :edit] do
        resources :draft_picks, except: [:new, :edit]
      end
      get 'user_options', to: "teams#user_options"
      resources :teams, except: [:new, :edit] do
        resources :team_seasons, except: [:new, :edit]
        get 'roster', to: "teams#roster"
      end
      resources :players, except: [:new, :edit] do
        resources :salaries, except: [:new, :edit]
      end
    end
  
  end

  root 'homepage#index'
  get '/*path' => 'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  

  # Defines the root path route ("/")
  # root "articles#index"
end
