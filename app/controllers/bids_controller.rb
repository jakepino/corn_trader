class BidsController < ApplicationController

    def create 
        @user = User.find(params[:bid][:user_id])
        @bid = Bid.create(user_id:params[:bid][:user_id],price:params[:bid][:price],corn_quantity:params[:bid][:corn_quantity])

        redirect_to @user 
        
    end 

    def destroy_bid
        @bid = Bid.find(params[:id])
        @user = User.find(params[:user_id])
        @bid.destroy
        redirect_to @user
    end 
 
end
