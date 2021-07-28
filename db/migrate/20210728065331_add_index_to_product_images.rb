class AddIndexToProductImages < ActiveRecord::Migration[6.1]
  def change
    add_index :product_images, :default
  end
end
