class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.date :service_date
      t.integer :total_attendants, limit: 8
      t.integer :total_new_converts, limit: 8
      t.text :sunday_school_teachers

      t.timestamps
    end
  end
end
