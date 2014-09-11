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

end
