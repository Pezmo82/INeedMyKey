class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.references :key, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
