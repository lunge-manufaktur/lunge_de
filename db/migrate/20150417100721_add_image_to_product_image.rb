class AddImageToProductImage < ActiveRecord::Migration[4.2]
  def change
    add_column :product_images, :image, :string
  end
end
