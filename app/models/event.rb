class Event < ActiveRecord::Base

# validations
  validates :event_name, presence: true, uniqueness: true
  validates :event_type, presence: true
  validates :from_date, presence: true
  validates :until_date, presence: true
  # validates :event_description, presence: true
  # validates :city, presence: true
  # validates :country, presence: true
  # validates :venue_name, presence: true
  # validates :venue_address, presence: true
  validates :event_website, presence: true

  private

    def event_dates
      if (@event.from_date.year == @event.until_date.year) and (@event.from_date.month == @event.until_date.month)
        "#{@event.from_date.day} - #{@event.until_date.day} #{@event.until_date.strftime '%b %Y'}"
      else
        "#{@event.from_date.strftime '%d %b, %Y'} - #{@event.until_date.strftime '%d %b, %Y'}"
      end
    end 
    
end
