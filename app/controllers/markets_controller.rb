class MarketsController < ApplicationController

    def index
       @bids   = Bid.all.sort_by{|offer| offer.price}.reverse
       @offers = Offer.all.sort_by{|offer| offer.price}
    end 
     
    
   private 

end