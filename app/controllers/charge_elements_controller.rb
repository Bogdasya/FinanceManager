class ChargeElementsController < ApplicationController

  def create
    @event = ChargeElement.new(charge_element_params)
    if @event.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @charge_element = ChargeElement.find(params[:id])
    @charge_element.delete
    redirect_to :back
  end

  private
  def charge_element_params
    params.require(:charge_element).permit(:name, :charge_id)
  end
end
