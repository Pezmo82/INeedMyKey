class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.references :user, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
