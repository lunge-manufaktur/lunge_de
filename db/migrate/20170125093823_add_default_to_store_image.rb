class AddDefaultToStoreImage < ActiveRecord::Migration[5.0]
  def change
    add_column :store_images, :default, :boolean, default: false
    add_index :store_images, :default
  end
end
