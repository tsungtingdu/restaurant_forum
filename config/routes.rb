Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "devise_users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "restaurants#index"

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    collection do
      get :feeds
    end

    member do
      get :dashboard
    end

    member do
      post :favorite
      post :unfavorite
    end  
  end  
  
  resources :categories, only: :show
  resources :users
  
  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

end
