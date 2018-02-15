Rails.application.routes.draw do
  resources :platformgames
  resources :tictactoegames
  resources :spaceshootergames
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :listings do
    resources :orders, only: [:new, :create]
  end

  
  get 'pages/about'
  get 'pages/contact'
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"

  root 'listings#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
