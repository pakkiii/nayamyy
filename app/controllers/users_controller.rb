class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @lives = @user.lives.order("created_at DESC")
    @users_count = User.group_by_day(:created_at).size
    @user_today = User.where(created_at: Date.today.all_day).count
    @users = User.all
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :sex)
  end

end
