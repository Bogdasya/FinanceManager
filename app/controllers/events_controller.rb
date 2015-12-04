class EventsController < ApplicationController

  def index
    @user = current_user
    @meetings = @user.events
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :start_at, :user_id, :end_at)
  end
end
