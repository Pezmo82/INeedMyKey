class AddStoredCheckToStorages < ActiveRecord::Migration
  def change
    add_column :storages, :is_stored, :boolean
  end
end
