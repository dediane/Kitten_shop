Rails.application.routes.draw do
  # HOME PAGE
  root to: "items#index"

  # USERS AND PROFILE PAGES
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show], path: "mon_compte" do 
    resources :carts, only: [:show], path: "mon_panier"  do 
      resources :charges, only: [:new, :create], path: "mes_paiements" 
    end
    resources :orders, only: [:show, :create, :new], path: "mes_commandes" 
  end

  # ITEMS PAGES
  resources :items, path: "chats" do
    resources :pictures, only: [:create]
  end

  # LINE ITEMS PAGES
  resources :line_items

  # Admin routes
  namespace :admin do
    resources :orders, only: :index
  end

  # TEAM PAGE
  resources :teams, only: :index
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
