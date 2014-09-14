namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'

    Event.delete_all

    Event.populate 20 do |event|
      event.event_name = Faker::Company.catch_phrase
      event.event_type = 'Exhibition'
      event.from_date = Time.now..3.month.since
      event.until_date = event.from_date + 3.days
      event.event_description = Populator.sentences(3..5)
      event.country = Faker::Address.country
      event.city = Faker::Address.city
      event.event_website = Faker::Internet.domain_name
      event.venue_name = Faker::Company.name
      event.venue_address = Faker::Address.street_address
    end
  end
end