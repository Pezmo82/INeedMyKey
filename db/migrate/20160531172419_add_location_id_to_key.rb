class AddLocationIdToKey < ActiveRecord::Migration
  def change
    add_reference :keys, :location, index: true, foreign_key: true
  end
end
