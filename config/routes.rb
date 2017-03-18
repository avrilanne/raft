Rails.application.routes.draw do
  resources :groups do
    resources :events, only: [:index]
  end

  resources :users, except: [:destry, :update]
  root 'sessions#new'
  end
