class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users_tables do |t|
      t.text :name
      t.text :email
      t.string :password_digest
      t.timestamps
    end
  end
end
