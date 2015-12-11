class IncomesController < ApplicationController

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to user_path(income_params[:user_id])
    else
      redirect_to :back
    end
  end

  def destroy
    @income = Income.find(params[:id])
    @income.delete
    redirect_to :back
  end

  private
  def income_params
    params.require(:income).permit(:title, :sum, :user_id)
  end
end
