Rails.application.routes.draw do
  # HOME PAGE
  root to: "items#index"

  # USERS AND PROFILE PAGES
  devise_for :users
  resources :users, only: [:show]

  # ITEMS PAGES
  resources :items

  # LINE ITEMS PAGES
  resources :line_items

  # CART PAGES
  resources :carts

  #ORDER PAGES
  resources :orders
  
  # STRIPE CHARGES PAGES
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
