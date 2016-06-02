class CreateRetrieves < ActiveRecord::Migration
  def change
    create_table :retrieves do |t|
      t.integer :key_id
      t.integer :location_id
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :is_stored
      t.boolean :was_retrieved

      t.timestamps null: false
    end
  end
end
