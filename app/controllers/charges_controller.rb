class ChargesController < ApplicationController

  def index
    @user = current_user
    @charges = current_user.charges
  end

  def create
    @charge = Charge.new(charge_params)
    if @charge.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private
  def charge_params
    params.require(:charge).permit(:name, :user_id)
  end
end