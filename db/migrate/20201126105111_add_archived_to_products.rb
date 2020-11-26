class AddArchivedToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :is_archived, :boolean, default: false
    add_index :products, :is_archived
  end
end
