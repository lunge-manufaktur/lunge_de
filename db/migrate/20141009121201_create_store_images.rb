class CreateStoreImages < ActiveRecord::Migration[4.2]
  def change
    create_table :store_images do |t|
      t.references :store, index: true

      t.timestamps
    end
  end
end
