Rails.application.routes.draw do
  resources :groups do
    resources :events
    resources :invitations
    resources :comments
  end

  resources :events do
    resources :comments
    resources :rsvps, only: [:new, :create, :destroy, :edit, :update]
  end

  resources :sessions

  resources :polls

  resources :answers, only: [:create]

  resources :users, except: [:index, :destroy, :update] do
    resources :memberships
  end

  resources :events do
    resources :comments
  end

  get '/groups/:id/invitations' => 'invitations#index', as: '_invitations'

  root 'memberships#index'
end
