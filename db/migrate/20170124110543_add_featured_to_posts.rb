class AddFeaturedToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :is_featured, :boolean
    add_index :posts, :is_featured
  end
end
