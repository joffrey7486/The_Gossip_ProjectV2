Rails.application.routes.draw do
  root to: "gossips#index"

  devise_for :users
  resources :user, only: [:show]
  resources :city, only: [:show]
  resources :gossips do
    resources :comments, except: [:index, :show]
    resources :likes, only: [:create, :destroy]
  end

end
