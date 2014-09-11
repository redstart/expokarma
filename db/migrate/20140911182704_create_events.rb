class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_type
      t.date :from_date
      t.date :until_date
      t.text :event_description
      t.string :country
      t.string :city
      t.string :venue_name
      t.string :venue_address
      t.string :event_website

      t.timestamps
    end
  end
end
