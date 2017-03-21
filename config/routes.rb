Rails.application.routes.draw do
  root 'memberships#index'

  post "transactions/send_funds"

  get "oauth/begin"
  get "oauth/return"

  get "oauth/authenticate"

  resources :groups do
    resources :events
    resources :invitations
    resources :comments
    resources :images
  end

  resources :events do
    resources :comments
    resources :rsvps, only: [:new, :create, :destroy, :edit, :update]
  end

  resources :sessions



  resources :polls

  resources :answers, only: [:create]

  resources :users, except: [:index, :destroy] do
    resources :memberships
  end

  resources :events do
    resources :comments
  end

  get '/groups/:id/invitations' => 'invitations#index', as: '_invitations'

end
