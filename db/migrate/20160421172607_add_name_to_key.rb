class AddNameToKey < ActiveRecord::Migration
  def change
    add_column :keys, :name, :text
  end
end
