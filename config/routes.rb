Rails.application.routes.draw do
  devise_for :users

  resource :post, only: [:new, :create]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
