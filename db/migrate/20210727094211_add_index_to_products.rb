class AddIndexToProducts < ActiveRecord::Migration[6.1]
  def change
    add_index :products, :is_published
    add_index :products, :is_featured
    add_index :products, :is_on_frontpage
  end
end
