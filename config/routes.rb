Rails.application.routes.draw do
  # HOME PAGE
  root to: "items#index"

  # USERS AND PROFILE PAGES
  resources :users, only: [:show]
  devise_for :users

  # ITEMS PAGES
  resources :items

  # LINE ITEMS PAGES
  resources :line_items

  # CART PAGES
  resources :carts

  #ORDER PAGES
  resources :orders
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
