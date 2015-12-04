class EventsController < ApplicationController
  def index
    @meetings = Event.all
  end
end
