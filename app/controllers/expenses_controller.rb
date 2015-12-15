class ExpensesController < ApplicationController

  def create
    expenses = Expense.new(expenses_params)
    if expenses.save
      redirect_to  user_path(expenses_params[:user_id])
    else
      if expenses.errors.size == 2
        flash[:error_title] = expenses.errors[:sum][0]
        flash[:error] = expenses.errors[:title][0]
      else
        (expenses.errors[:sum][0].present?)? flash[:error] = expenses.errors[:sum][0] : flash[:error_title] = expenses.errors[:title][0]
      end
      redirect_to :back
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.delete
    redirect_to :back
  end

  private
  def expenses_params
    params.require(:expense).permit(:title, :sum, :user_id)
  end
end
