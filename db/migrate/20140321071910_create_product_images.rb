class CreateProductImages < ActiveRecord::Migration[4.2]
  def change
    create_table :product_images do |t|
      t.references :product, index: true

      t.timestamps
    end
  end
end
