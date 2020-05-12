class CreateTableTicketsTags < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tickets, :tags
  end
end
