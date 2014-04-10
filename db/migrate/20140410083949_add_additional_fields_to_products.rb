class AddAdditionalFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_on_sale, :boolean
    add_column :products, :is_on_frontpage, :boolean
    add_column :products, :is_featured, :boolean
  end
end
