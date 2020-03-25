class MarketsController < ApplicationController

    def index
       @bids   = Bid.all.sort_by{|offer| offer.price}.reverse
       @offers = Offer.all.sort_by{|offer| offer.price}
       @user = @current_user
       @bid = Bid.new
       @offer = Offer.new
    end 
     
end