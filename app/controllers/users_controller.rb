class UsersController < ApplicationController
      before_action :find_user, only: [:show, :edit, :update, :delete]
      skip_before_action :logged_in, only: [:new, :create]
     def show 
        if @current_user.id == params[:id].to_i
        @bids   = Bid.all.sort_by{|offer| offer.price}.reverse
        @offers = Offer.all.sort_by{|offer| offer.price}
        @bid = Bid.new
        @offer = Offer.new
        render :show
        else
         redirect_to user_path(@current_user.id)
        end
     end 

     def new
      @user = User.new
     end

     def create
      @user = User.new(user_params)
      if @user.save
         redirect_to user_path(@user)
      else
         flash[:errors] = @user.errors.full_messages
         redirect_to new_user_path
      end
     end

     def edit
     end

     
    private 
    def user_params
      params.require(:user).permit(:email, :name, :amount_of_corn, :amount_of_money, :password, :password_confirmation)
    end

    def find_user
      @user   = User.find(params[:id])
    end

end
