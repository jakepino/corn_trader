Rails.application.routes.draw do
  resources :trades
  resources :offers
  resources :bids
  resources :users
  resources :markets

  post '/trades/sell/:user_id/:bid_id', to: 'trades#market_sell'
  post '/trades/buy/:user_id/:offer_id', to: 'trades#market_buy'
  post '/bids/destroybid/:id/:user_id',to:'bids#destroy_bid'
  post '/offers/destroyoffers/:id/:user_id',to:'offers#destroy_offer'
 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
