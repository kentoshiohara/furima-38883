Rails.application.routes.draw do
  root to:"items#index"
  resources :item, only: [:index]
end
