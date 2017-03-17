Rails.application.routes.draw do
  resources :groups do
    resources :events, only: [:index]
  end
end
