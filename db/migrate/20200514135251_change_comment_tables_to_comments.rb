class ChangeCommentTablesToComments < ActiveRecord::Migration[6.0]
  def change
    rename_table :comment_tables, :comments
  end
end
