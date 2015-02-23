class UsersController < ApplicationController
before_action :set_user, only: [:update, :edit, :destroy, :show]
  def index
  @users = User.all.reverse
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

private

def user_params
  params.require(:user).permit(:user_name, :password, :about)
end

def set_user
  @user = User.find(params[:id])
end

end
