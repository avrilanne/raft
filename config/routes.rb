Rails.application.routes.draw do
  resources :groups do
    resources :events, only: [:index]
  end

  resources :users
  root 'sessions#new'
  end
