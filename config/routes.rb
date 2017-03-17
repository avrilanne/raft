Rails.application.routes.draw do
  resources :groups do
    resources :events
  end
end
