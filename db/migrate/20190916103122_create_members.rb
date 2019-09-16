class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.number :contacts
      t.string :residence
      t.date :join_date
      t.boolean :born_again
      t.boolean :spirit_filled

      t.timestamps
    end
  end
end
