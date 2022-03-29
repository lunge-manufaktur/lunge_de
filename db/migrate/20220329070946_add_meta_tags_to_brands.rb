class AddMetaTagsToBrands < ActiveRecord::Migration[6.1]
  def change
    add_column :brands, :meta_title, :text
    add_column :brands, :meta_description, :text
  end
end
