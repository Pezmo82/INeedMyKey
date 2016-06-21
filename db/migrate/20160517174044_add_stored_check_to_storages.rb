class AddStoredCheckToStorages < ActiveRecord::Migration
  def change
    add_column :storages, :is_stored, :boolean, false, 0
  end
end
