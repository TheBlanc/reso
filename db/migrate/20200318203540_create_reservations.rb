class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :phonenumber
      t.integer :partysize
      t.date :date
      t.integer :time
      t.text :notes

      t.timestamps
    end
  end
end
