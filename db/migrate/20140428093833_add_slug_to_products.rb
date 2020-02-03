class AddSlugToProducts < ActiveRecord::Migration[4.2]
  def change
    add_column :products, :slug, :string
    add_index :products, :slug
  end
end
