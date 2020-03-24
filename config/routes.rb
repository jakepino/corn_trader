Rails.application.routes.draw do
  resources :trades
  resources :offers
  resources :bids
  resources :users
  resources :markets

  post '/trades/sell/:user_id/:bid_id', to: 'trades#market_sell'
  post '/trades/buy/:user_id/:offer_id', to: 'trades#market_buy'
 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
