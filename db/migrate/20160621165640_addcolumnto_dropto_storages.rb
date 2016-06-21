class AddcolumntoDroptoStorages < ActiveRecord::Migration
  def change
 	add_column :storages, :to_drop, :boolean, false, 0
  end
end
