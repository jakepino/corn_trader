class MarketsController < ApplicationController
    before_action :bot_market
    
    def index
       @user = @current_user
       @bids   = Bid.all.sort_by{|offer| offer.price}.reverse
       @offers = Offer.all.sort_by{|offer| offer.price}
       @bid = Bid.new
       @offer = Offer.new
    end 
 private 

  def bot_market_sell(bot,bids)
    if bids.length > 0
        bid = bids[0]
        trade = Trade.create(buyer_id:bid.user_id,seller_id:bot.id,price:bid.price,corn_quantity:bid.corn_quantity)
        bid.destroy 
        total = trade.price * trade.corn_quantity
        buyer = User.find(trade.buyer_id)
        bot.update(amount_of_money:bot.amount_of_money+total,amount_of_corn:bot.amount_of_corn-trade.corn_quantity)
        #below updates the user totals 
        buyer.update(amount_of_money:buyer.amount_of_money-total, amount_of_corn:buyer.amount_of_corn+trade.corn_quantity)
        #refreshes the market
    end 
 end 

 def bot_market_buy(bot,offers)
    if offers.length > 0 
        offer = offers[0]
        trade = Trade.create(buyer_id:bot.id,seller_id:offer.user_id,price:offer.price,corn_quantity:offer.corn_quantity)
        offer.destroy 
        total = trade.price * trade.corn_quantity
        seller = User.find(trade.seller_id)
        bot.update(amount_of_money:bot.amount_of_money-total,amount_of_corn:bot.amount_of_corn+trade.corn_quantity)
        #below updates the user totals 
        seller.update(amount_of_money:seller.amount_of_money+total, amount_of_corn:seller.amount_of_corn-trade.corn_quantity)
        #refreshes the market
    end 
end 








def bot_market 
    bids   = Bid.all.sort_by{|offer| offer.price}.reverse
    offers = Offer.all.sort_by{|offer| offer.price}
    bots = User.all.select{|user| user.bot == true}
    recent_trade= Trade.all.last

    bots.each do |bot|
        act = rand()
        if act < 0.25
         Bid.create( price:bids[0].price-1, corn_quantity: rand(bot.amount_of_corn),user_id:bot.id )
        elsif 0.25 < act && act < 0.50
         Offer.create( price:offers[0].price+1, corn_quantity: rand(bot.amount_of_corn),user_id:bot.id )
        elsif 0.50 < act && act < 0.75
         if bot.id != offers[0].id
           bot_market_buy(bot,offers)
         end
        elsif 0.75 < act && act < 1.0
         if bot.id != bids[0].id
           bot_market_sell(bot,bids)
         end 
        end 
    end 
 end 
end