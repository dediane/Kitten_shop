Rails.application.routes.draw do
  # HOME PAGE
  root to: "items#index"

  # USERS AND PROFILE PAGES
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show] do 
    resources :carts, only: [:show] do 
      resources :charges, only: [:new, :create]
    end
    resources :orders, only: [:show]
  end

  # ITEMS PAGES
  resources :items

  # LINE ITEMS PAGES
  resources :line_items
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
