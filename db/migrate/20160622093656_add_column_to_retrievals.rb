class AddColumnToRetrievals < ActiveRecord::Migration
  def change
  	   	add_column :retrievals, :last_location, :int
  end
end
