class WalletsController < ApplicationController

  def create
    @wallet = Wallet.new(wallet_params)
    if @wallet.save
      redirect_to User.find(wallet_params[:user_id]), notice: 'Wallet succesfully created'
    else
      redirect_to :back
    end
  end

  def update
    @wallet = User.find(wallet_params[:user_id]).wallet
    @wallet.update(wallet_params)
    redirect_to :back, notice: 'Wallet succesfully updated'
  end

  private
  def wallet_params
    params.require(:wallet).permit(:name, :money, :user_id)
  end
end
