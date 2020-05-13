class AddColumnCreatorId < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :creator_id, :integer
  end
end
