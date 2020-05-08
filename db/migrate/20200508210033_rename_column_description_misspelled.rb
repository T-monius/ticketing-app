class RenameColumnDescriptionMisspelled < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :desctription, :description
  end
end
