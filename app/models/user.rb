class User < ApplicationRecord
    has_many :bids 
    has_many :offers
    has_many :trades
    has_many :users through: :trades
end
