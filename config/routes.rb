Rails.application.routes.draw do
  resources :groups do
    resources :events
  end

  resources :users, except: [:index, :destroy, :update] do
    resources :memberships
    resources :invitations
  end

  get '/users' => 'users#index', as: '_users'
  root 'sessions#new'

end
