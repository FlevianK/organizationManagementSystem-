class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :department
      t.date :event_date
      t.string :event_name
      t.text :event_description
      t.text :event_guest
      t.text :event_venue

      t.timestamps
    end
  end
end
