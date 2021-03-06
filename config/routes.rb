Rails.application.routes.draw do
  resources :platformgames
  resources :tictactoegames
  resources :spaceshootergames
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :listings do
    resources :orders, only: [:new, :create]
  end
  resources :users
  resources :conversations do
    resources :messages

    collection do
      get :inbox
      get :all, action: :index
      get :sent
      get :trash
    end
  end

  get 'pages/platformgamedemo'
  get 'pages/spaceshootergamedemo'
  get 'pages/tictactoegamedemo'
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"

  root 'listings#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end