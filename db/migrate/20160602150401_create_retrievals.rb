class CreateRetrievals < ActiveRecord::Migration
  def change
    create_table :retrievals do |t|
      t.references :key, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :is_stored, false, 0
      t.boolean :was_retrieved, false, 0

      t.timestamps null: false
    end
  end
end
