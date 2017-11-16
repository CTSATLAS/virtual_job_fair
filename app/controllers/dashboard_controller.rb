class DashboardController < ApplicationController
  def index
    @event = Event.find_current_or_next.first
  end
end
