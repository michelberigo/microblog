class UsersController < ApplicationController
	before_action :set_user, only: [:show]
	skip_before_action :authenticate_user!, only: [:index, :show]

	def dashboard
		@user = current_user
	end

	def index
		if params[:term]
			@users = User.where('username LIKE ?', "%#{params[:term]}%")
		else
			@users = User.all
		end
	end

	def show
  	end

  	def following
	    @title = "Following"
	    @user  = User.find(params[:id])
	    @users = @user.following
	    render 'show_follow'
	end

	def followers
	    @title = "Followers"
	    @user  = User.find(params[:id])
	    @users = @user.followers
	    render 'show_follow'
	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
