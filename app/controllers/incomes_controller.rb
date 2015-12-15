class IncomesController < ApplicationController

  def create
    income = Income.new(income_params)
    if income.save
      redirect_to user_path(income_params[:user_id])
    else
      if income.errors.size == 2
        flash[:alert] = income.errors[:sum][0]
        flash[:alert_title] = income.errors[:title][0]
      else
        (income.errors[:sum][0].present?)? flash[:alert] = income.errors[:sum][0] : flash[:alert_title] = income.errors[:title][0]
      end
      redirect_to :back
    end
  end

  def destroy
    income = Income.find(params[:id])
    income.delete
    redirect_to :back
  end

  private
  def income_params
    params.require(:income).permit(:title, :sum, :user_id)
  end
end
