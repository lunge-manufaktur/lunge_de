class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :name
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
    end
    add_index :product_categories, :parent_id
    add_index :product_categories, :lft
    add_index :product_categories, :rgt
    add_index :product_categories, :depth
  end
end
