Rails.application.routes.draw do
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                     }
  devise_scope :user do
    get "registrations_address", to: "users/registrations#new_address"
    post "registrations_address", to: "users/registrations#create_address"
  end
  root "products#index"
  resources :users 
  resources :credits
  resources :products do
    resources :purchases
    resources :comments, only: [:create]
  end
  resources :favorites, only: [:index, :create, :destroy]
  resources :brands
  resources :categories
  resources :addresses
  resources :infomations
end
