Rails.application.routes.draw do
  resources :platformdemos
  resources :spaceshooters
  resources :tictactoes
  resources :platforms
  devise_for :users
  resources :listings do
  	resources :orders, only: [:new, :create]
  end
  resources :conversations do
    resources :messages

    collection do
      get :inbox
      get :all, action: :index
      get :sent
      get :trash
    end
  end
  
  get 'pages/about'
  get 'pages/contact'
  get 'pages/spaceshootergamedemo'
  get 'pages/tictactoegamedemo'
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"

  root 'listings#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
