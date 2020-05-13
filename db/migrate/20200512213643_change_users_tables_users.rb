class ChangeUsersTablesUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :users_tables, :users
  end
end
