class CreateLeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :leaders do |t|
      t.string :department
      t.string :title
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
