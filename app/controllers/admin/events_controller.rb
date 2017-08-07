module Admin
  class EventsController < BaseController
    def index
      @events = Event.all
    end

    def create
      event = Event.new(event_params)

      if event.save
        redirect_to admin_events_path
      else
        logger.info event.inspect
      end
    end

    protected

    def event_params
      params.require(:event).permit(:title, :specialty, :visible_start, :visible_end, :starts_at, :ends_at, :allow_late_registration)
    end
  end
end
