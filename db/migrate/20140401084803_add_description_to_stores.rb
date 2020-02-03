class AddDescriptionToStores < ActiveRecord::Migration[4.2]
  def change
    add_column :stores, :description, :text
  end
end
