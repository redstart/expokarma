class EventsController < ApplicationController

def index
  @events = Event.all
end

def new
  @event = Event.new
end

def create
  @event = Event.new(event_params)
  if @event.save
    redirect_to @event
  else
    render :new
  end
end

def show
  @event = Event.find(params[:id])
end

def edit
  @event = Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])
  if @event.update_attributes(event_params)
    redirect_to @event
  else
    render :new
  end
end

def destroy
  @event = Event.find(params[:id]).destroy
  redirect_to :index
end

  private

    def event_params
      params.require(:event).permit(:event_name, :event_type, 
                                    :from_date, :until_date, 
                                    :event_description, :country, :city, 
                                    :venue_name, :venue_address, :event_website, 
                                    :event_image, :remove_event_image)
    end

    
end
