Rails.application.routes.draw do
  devise_for :users
  root to: 'lives#index'

  resources :relationships, only: [:create, :destroy]

  resources :users, only: [:edit, :update, :show]

  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]

  resources :lights, only: [:index]
  
  resources :lives do
    resources :yells, only: [:index, :create, :destroy]
    resource :like, only: [:create, :destroy]
  end

end
