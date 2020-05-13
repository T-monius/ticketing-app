class DropColumnsFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :creator, :integer
    remove_column :tickets, :assignee, :integer
  end
end
