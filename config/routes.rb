Rails.application.routes.draw do
  devise_for :users
  namespace :notifications do
    resources :preferences
    resources :broadcasts
    resources :channels
  end
  resources :notifications, only: [:index]

  root to: "notifications#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
