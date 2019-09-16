class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :code
      t.integer :total_members

      t.timestamps
    end
  end
end
