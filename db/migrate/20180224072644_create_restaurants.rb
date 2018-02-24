class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :tel, null: false
      t.string :address, null: false
      t.string :opening_hours, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
