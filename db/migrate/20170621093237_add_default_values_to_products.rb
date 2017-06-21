class AddDefaultValuesToProducts < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :is_published, :boolean, default: false
  	change_column :products, :is_on_sale, :boolean, default: false
  	change_column :products, :is_on_frontpage, :boolean, default: false
  	change_column :products, :is_featured, :boolean, default: false
  end
end
