class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.text :name
      t.text :body
      t.text :status
      t.integer :project_id
    end
  end
end
