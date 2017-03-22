Rails.application.routes.draw do
  root 'memberships#index'

  get "transactions/send_funds"
  # put "charge_users"

  get "oauth/begin"
  get "oauth/return"

  get "oauth/authenticate"

  resources :groups, except: [:index, :destroy] do
    resources :events, except: [:index]
    resources :comments
    resources :invitations
    resources :images
  end

  resources :events do

    resources :comments
    resources :rsvps, only: [:new, :create, :destroy, :edit, :update]
  end

  resources :sessions, except: [:index]


  resources :polls, except: [:index]

  resources :answers, only: [:create]

  resources :users, except: [:destroy, :index] do
    resources :memberships
  end

  resources :events do
    resources :comments
  end
  put 'events/:id/charge_users' => 'events#charge_users', as: 'event_charge_users'
  get '/groups/:id/invitations' => 'invitations#index', as: '_invitations'
  get "*any", via: :all, to: "errors#not_found"
end
