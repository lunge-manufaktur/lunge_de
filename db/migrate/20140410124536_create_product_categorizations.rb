class CreateProductCategorizations < ActiveRecord::Migration[4.2]
  def change
    create_table :product_categorizations do |t|
      t.references :product, index: true
      t.references :product_category, index: true

      t.timestamps
    end
  end
end
