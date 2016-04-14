class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :location
      t.text :line1
      t.text :line2
      t.text :line3
      t.text :parish

      t.timestamps null: false
    end
  end
end
