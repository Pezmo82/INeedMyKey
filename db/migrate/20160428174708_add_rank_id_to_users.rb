class AddRankIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :rank, index: true, foreign_key: true
  end
end
