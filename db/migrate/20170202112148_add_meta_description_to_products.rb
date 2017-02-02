class AddMetaDescriptionToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :meta_description, :text
  end
end
