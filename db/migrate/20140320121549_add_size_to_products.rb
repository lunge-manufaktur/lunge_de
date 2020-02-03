class AddSizeToProducts < ActiveRecord::Migration[4.2]
  def change
    add_column :products, :size_id, :integer
    add_index :products, :size_id
  end
end
