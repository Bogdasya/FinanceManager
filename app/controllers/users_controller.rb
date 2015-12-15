class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    begin
      @user = User.includes(:incomes, :expenses).find(params[:id]).decorate
    rescue ActiveRecord::RecordNotFound
      render 'devise/sessions/new.html.erb'
    end
  end

  def update
    @user = User.find(user_params[:id])
    @user.update(user_params)
    flash[:alert_user] = @user.errors[:first_name][0]
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :email, :last_name, :mobile_phone, :id)
  end
end
