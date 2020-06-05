Rails.application.routes.draw do
  devise_for :users
  root 'reviews#index'
  resources :reviews
  resources :users, only: :show
end
