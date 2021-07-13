class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update follow unfollow followings followers ]

  def index
    @users = User.all
  end

  def show
  end

  def follow
    current_user.followings << @user

    redirect_to users_path, notice: "Usuário seguido."
  end

  def unfollow
    current_user.followings.delete(@user)

    redirect_to users_path, notice: "Usuário deixado de seguir."
  end

  def followings
    @user
  end

  def followers
    @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.fetch(:post, {})
    end
end
  