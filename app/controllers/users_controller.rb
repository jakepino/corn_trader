class UsersController < ApplicationController

     def show 
        @user   = User.find(params[:id])
        @bids   = Bid.all.sort_by{|offer| offer.price}.reverse
        @offers = Offer.all.sort_by{|offer| offer.price}
        @bid = Bid.new
        @offer = Offer.new
     end 
      
     
    private 

end
