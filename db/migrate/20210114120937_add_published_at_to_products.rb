class AddPublishedAtToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :published_at, :datetime
    add_index :products, :published_at
  end
end
