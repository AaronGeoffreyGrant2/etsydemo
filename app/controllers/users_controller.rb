class UsersController < ApplicationController

  def index
  	 @users = User.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
  end

  def show
  	@user = User.find(params[:id])
  	@user_listings = @user.listings
  end
end
