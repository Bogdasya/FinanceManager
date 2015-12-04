class ExpensesController < ApplicationController

  def create

    @expenses = Expense.new(expenses_params)
    if @expenses.save
      redirect_to  user_path(expenses_params[:user_id])
    else
      redirect_to :back
    end
  end

  private
  def expenses_params
    params.require(:expense).permit(:title, :sum, :user_id)
  end
end
