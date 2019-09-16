class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.date :service_date
      t.integer :total_attendants
      t.integer :total_new_coverts
      t.text :sunday_school_teachers

      t.timestamps
    end
  end
end
