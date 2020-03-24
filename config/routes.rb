Rails.application.routes.draw do
  resources :trades
  resources :offers
  resources :bids
  resources :users
  resources :markets
  # resources :sessions, only: [:new, :create, :destroy]
  root to: 'sessions#new'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login/new', to: 'sessions#new', as: 'new_login'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  post '/trades/sell/:user_id/:bid_id', to: 'trades#market_sell'
  post '/trades/buy/:user_id/:offer_id', to: 'trades#market_buy'
 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
