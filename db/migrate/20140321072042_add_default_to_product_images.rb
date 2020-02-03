class AddDefaultToProductImages < ActiveRecord::Migration[4.2]
  def change
    add_column :product_images, :default, :boolean, :null => false, :default => false
  end
end
