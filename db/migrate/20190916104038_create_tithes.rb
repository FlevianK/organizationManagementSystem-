class CreateTithes < ActiveRecord::Migration[5.2]
  def change
    create_table :tithes do |t|
      t.string :name
      t.string :contacts
      t.date :tithe_date
      t.boolean :member
      t.integer :amount, limit: 8

      t.timestamps
    end
  end
end
