Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "restaurants#index"

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end  
  
  resources :categories, only: :show
  resources :users
  
  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
