class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :open_at
      t.integer :close_at
      t.integer :capacity

      t.timestamps
    end
  end
end
