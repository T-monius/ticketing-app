class DropTableTagsTickets < ActiveRecord::Migration[6.0]
  def change
    drop_table :tags_tickets
  end
end
