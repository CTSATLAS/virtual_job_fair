module Admin
  class EventsController < BaseController
    load_and_authorize_resource

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

    def update
      event = Event.find(params[:id])

      if event.update_attributes(event_params)
        redirect_to admin_events_path
      else
        logger.info event.inspect
      end
    end

    def destroy
      event = Event.find(params[:id])
      event.destroy

      respond_to do |format|
        format.json { render json: { success: true }, status: :ok }
      end
    end

    protected

    def event_params
      params.require(:event).permit(:title, :specialty, :visible_start, :visible_end, :starts_at, :ends_at, :allow_late_registration)
    end
  end
end
