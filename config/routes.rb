Rails.application.routes.draw do
  resources :groups do
    resources :events
  end
  resources :polls
  resources :answers, only: [:create]
  resources :users, except: [:destry, :update]
  root 'sessions#new'
end
