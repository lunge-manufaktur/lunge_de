class AddImageToProductImage < ActiveRecord::Migration
  def change
    add_column :product_images, :image, :string
  end
end
