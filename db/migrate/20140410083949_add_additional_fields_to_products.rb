class AddAdditionalFieldsToProducts < ActiveRecord::Migration[4.2]
  def change
    add_column :products, :is_on_sale, :boolean
    add_column :products, :is_on_frontpage, :boolean
    add_column :products, :is_featured, :boolean
  end
end
