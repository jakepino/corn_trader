class TradesController < ApplicationController
    def market_sell
        @user = @current_user
        @bid = Bid.find(params[:bid_id])
        @trade = Trade.create(buyer_id:@bid.user_id,seller_id:@user.id,price:@bid.price,corn_quantity:@bid.corn_quantity)
        flash[:bid] = @bid.price * @bid.corn_quantity
        @bid.destroy
        total = @trade.price * @trade.corn_quantity
        buyer = User.find(@trade.buyer_id)
        @current_user.update(amount_of_money:@user.amount_of_money+total,amount_of_corn:@user.amount_of_corn-@trade.corn_quantity)
          #below updates the user totals 
        buyer.update(amount_of_money:buyer.amount_of_money-total, amount_of_corn:buyer.amount_of_corn+@trade.corn_quantity)
         #refreshes the market
        redirect_to markets_path
    end 

    def market_buy
        @user = @current_user
        @offer = Offer.find(params[:offer_id])
        @trade = Trade.create(buyer_id:@user.id,seller_id:@offer.user_id,price:@offer.price,corn_quantity:@offer.corn_quantity)
        flash[:offer] = @offer.price * @offer.corn_quantity
        @offer.destroy 
        total = @trade.price * @trade.corn_quantity
        seller = User.find(@trade.seller_id)
        @current_user.update(amount_of_money:@user.amount_of_money-total,amount_of_corn:@user.amount_of_corn+@trade.corn_quantity)
          #below updates the user totals 
        seller.update(amount_of_money:seller.amount_of_money+total, amount_of_corn:seller.amount_of_corn-@trade.corn_quantity)
         #refreshes the market
        redirect_to markets_path
    end 

    def most_recent
        @last_trade
    end

end
