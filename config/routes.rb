Rails.application.routes.draw do
  devise_for :users
  root to: 'lives#index'

  resources :users, only: [:edit, :update, :show]
  
  resources :lives do
    resources :yells, only: [:index, :create, :destroy] 
  end

end
