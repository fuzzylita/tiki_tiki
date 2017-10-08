class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :ingredients
      t.string :instructions
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
