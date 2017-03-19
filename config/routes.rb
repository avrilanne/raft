Rails.application.routes.draw do
  resources :groups do
    resources :events
    resources :invitations

  end
  resources :sessions

  resources :polls

  resources :answers, only: [:create]

  resources :users, except: [:index, :destroy, :update] do
    resources :memberships
  end

  get '/groups/:id/invitations' => 'invitations#index', as: '_invitations'

  root 'memberships#index'
end
