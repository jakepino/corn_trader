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
  
     bots = User.all.select{|user| user.bot == true}
     
    bots.each do |bot|
     if Offer.all.length>0 && Bid.all.length>0
        offers = Offer.all.sort_by{|offer| offer.price}
        bids   = Bid.all.sort_by{|offer| offer.price}.reverse
        recent_trade = Trade.all.reverse[0]
        act = rand()
        if act < 0.25
         if recent_trade.price > bids[0].price && recent_trade.price-1 < offers[0].price
          Bid.create( price:recent_trade.price-1, corn_quantity: rand(100),user_id:bot.id )
          
          if bot.bids.length > 5
              
            bot.bids[0].destroy
        
          end  
          
         else
          
            Bid.create( price:bids[0].price-1, corn_quantity: rand(100),user_id:bot.id )
            
            if bot.bids.length > 5
              
                bot.bids[0].destroy
            
            end  

         end 
        elsif 0.25 < act && act < 0.50
          if recent_trade.price < offers[0].price && recent_trade.price+1 < bids[0].price
          Offer.create( price:recent_trade.price+1, corn_quantity: rand(100),user_id:bot.id )  
          bot.offers[0].destroy
          else
          Offer.create(price:offers[0].price+1, corn_quantity: rand(100),user_id:bot.id )
            if bot.offers.length >5
              bot.offers[0].destroy
            end
          end
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
end