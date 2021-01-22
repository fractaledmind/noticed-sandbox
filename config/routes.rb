Rails.application.routes.draw do
  resources :notifications, only: [:index]
  resources :notification_requests
  resources :notification_channels
  devise_for :users
  root to: "notifications#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
