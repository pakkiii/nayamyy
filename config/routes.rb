Rails.application.routes.draw do
  devise_for :users
  root to: 'lives#index'

  resources :relationships, only: [:create, :destroy]

  resources :users, only: [:edit, :update, :show]

  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]

  resources :lights, only: [:index]
  
  resources :lives do
    resources :yells, only: [:index, :create, :destroy]
    resource :like, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  get '/searc', to:'lives#searc'
  get '/private', to:'lives#private'
  get '/family', to:'lives#family'
  get '/work', to:'lives#work'
  get '/school', to:'lives#school'
  get '/other', to:'lives#other'

end
