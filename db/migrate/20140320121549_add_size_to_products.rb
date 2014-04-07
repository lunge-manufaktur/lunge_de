class AddSizeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :size_id, :integer
    add_index :products, :size_id
  end
end
