class AddWasRetrievedToStorages < ActiveRecord::Migration
  def change
    add_column :storages, :was_retrieved, :boolean, false, 0
  end
end
