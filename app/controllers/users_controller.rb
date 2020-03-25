class UsersController < ApplicationController
      before_action :find_user, only: [:show, :edit, :update, :destroy]
      skip_before_action :logged_in, only: [:new, :create]
      skip_before_action :current_user, only: [:new, :create]
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
         session[:user_id] = @user.id
         redirect_to markets_path
      else
         flash[:errors] = @user.errors.full_messages
         redirect_to new_user_path
      end
     end

     def destroy
        @user.destroy
        redirect_to login_path
     end

     
    private 
    def user_params
      params.require(:user).permit(:email, :name, :amount_of_corn, :amount_of_money, :password, :password_confirmation)
    end

    def find_user
      @user = User.find(params[:id])
    end

end
