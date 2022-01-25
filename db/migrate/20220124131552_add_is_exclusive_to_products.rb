class AddIsExclusiveToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :is_exclusive, :boolean, default: false
    add_index :products, :is_exclusive
  end
end
