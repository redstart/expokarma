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
end

  private

    def event_params
      params.require(:event).permit(:event_name, :event_type, 
                                    :from_date, :until_date, 
                                    :event_description, :country, :city, 
                                    :venue_name, :venue_address, :event_website)
    end

    def event_dates
      if (@event.from_date.year == @event.until_date.year) and (@event.from_date.month == @event.until_date.month)
        "#{@event.from_date.day} - #{@event.until_date.day} #{@event.until_date.strftime '%b %Y'}"
      else
        "#{@event.from_date.strftime '%d %b, %Y'} - #{@event.until_date.strftime '%d %b, %Y'}"
      end
    end 
end
