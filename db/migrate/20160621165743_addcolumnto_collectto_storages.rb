class AddcolumntoCollecttoStorages < ActiveRecord::Migration
  def change
   	add_column :storages, :to_collect, :boolean, false, 0
  end
end
