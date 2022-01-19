Rails.application.routes.draw do
  root 'posts#index'
  
  devise_for :users

  resource :post_likings, only: [:create, :destroy]
  
  resources :posts, only: [:index, :new, :create]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
