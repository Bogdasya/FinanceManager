class UsersController < ApplicationController

  def show
   @user = User.find(params[:id]).decorate
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:success] = "Welcome to the Sample App!"
    redirect_to @user
  end

  def events_calendar

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :email, :last_name, :mobile_phone)
  end
end
