module EventsHelper
  def event_dates
      if (event.from_date.year == event.until_date.year) and (event.from_date.month == event.until_date.month)
        "#{event.from_date.day} - #{event.until_date.day} #{event.until_date.strftime '%b %Y'}"
      else
        "#{event.from_date.strftime '%d %b, %Y'} - #{event.until_date.strftime '%d %b, %Y'}"
      end
    end 
end
