class IndexUsersOnApproved < ActiveRecord::Migration
  def change
    add_index :users, :approved
  end
end
