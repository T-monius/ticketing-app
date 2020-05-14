class CreateCommentTable < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_tables do |t|
      t.text :body
      t.integer :creator_id
      t.timestamps
    end
  end
end
