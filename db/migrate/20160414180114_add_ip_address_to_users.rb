class AddIpAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ipAddress, :text
  end
end
