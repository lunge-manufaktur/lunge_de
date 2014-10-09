class CreateStoreImages < ActiveRecord::Migration
  def change
    create_table :store_images do |t|
      t.references :store, index: true

      t.timestamps
    end
  end
end
