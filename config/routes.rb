Rails.application.routes.draw do
  devise_for :users

  resource :friendship, only: [:create]
  resources :notifications, only: [:index, :create, :destroy]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
