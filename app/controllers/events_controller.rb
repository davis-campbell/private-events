class EventsController < ApplicationController
  before_action { @current_user = current_user }
  
  def index
    @events = Event.all
  end
  
  def new
    @event = @current_user.created_events.build
  end
  
  def create
    @event = @current_user.created_events.build(event_params)
    if @event.save
      redirect_to events_path
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  private
  
    def event_params
      params.require(:event).permit(:name, :description)
    end
end
