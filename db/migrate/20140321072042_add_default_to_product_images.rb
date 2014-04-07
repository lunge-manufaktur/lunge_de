class AddDefaultToProductImages < ActiveRecord::Migration
  def change
    add_column :product_images, :default, :boolean, :null => false, :default => false
  end
end
