class DropUsers < ActiveRecord::Migration
  def up
    drop_table 'users'
    drop_table 'admin_users'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
