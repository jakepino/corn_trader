class User < ApplicationRecord
    has_many :bids 
    has_many :offers
    # has_many :trades
    # has_many :users, through: :trades
    has_secure_password 

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true, on: :create 
    validates :password, length: { minimum: 6 }, on: :create
    validates :amount_of_corn, presence: true
    validates :amount_of_corn, numericality: { only_integer: true, greater_than: 0},on: :create
    # validates :amount_of_corn, numericality: { greater_than: 0}
    validates :amount_of_money, presence: true
    validates :amount_of_money, numericality: { only_integer: true, greater_than: 0},on: :create
    # validates :amount_of_money, numericality: { greater_than: 0}
    
    def trades
        trade_arr = Trade.all.find_all {|offer| offer.buyer_id == self.id}
        trade_arr << Trade.all.find_all {|bid| bid.seller_id == self.id}
        trade_arr.flatten
    end
    def total_trades
       self.trades.count
    end

    def total_money
        prices = self.trades.map {|trade| trade.price}
        sum = prices.reduce(:+)
        sum
    end

    def total_corn
        corn = self.trades.map {|trade| trade.corn_quantity}
        sum = corn.reduce(:+)
        sum
    end

    def ave_bid
        all_bids = self.bids
        ave = all_bids.reduce(:+)/all_bids.count
        ave
    end

    def ave_offer
        all_offers = self.offers
        ave = all_offers.reduce(:+)/all_offers.count
        ave
    end
end