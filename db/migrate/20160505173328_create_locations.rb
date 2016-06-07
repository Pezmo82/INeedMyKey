class CreateLocations < ActiveRecord::Migration
	def change
		create_table :locations do |t|
			t.string :name
			t.string :address_line_1
			t.string :address_line_2
			t.string :parish
			t.string :post_code
			t.integer :capacity
			t.timestamps null: false
		end
	end
end
