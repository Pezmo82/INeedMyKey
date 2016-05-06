class AddAuthCodeToKeys < ActiveRecord::Migration
  def change
    add_column :keys, :auth_code, :string
  end
end
