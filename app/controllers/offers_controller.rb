class OffersController < ApplicationController


    def create 
        @user = User.find(params[:offer][:user_id])
        @offer = Offer.create(user_id:params[:offer][:user_id],price:params[:offer][:price],corn_quantity:params[:offer][:corn_quantity])

        redirect_to @user 

    end 
    
    def destroy_offer
        @offer = Offer.find(params[:id])
        @user = User.find(params[:user_id])
        @offer.destroy
        redirect_to @user
    end 
end
