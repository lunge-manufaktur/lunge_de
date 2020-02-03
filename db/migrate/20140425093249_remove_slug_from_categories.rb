class RemoveSlugFromCategories < ActiveRecord::Migration[4.2]
  def change
    remove_column :categories, :slug, :remove
  end
end
