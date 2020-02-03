class AddLatitudeAndLongitudeToStores < ActiveRecord::Migration[4.2]
  def change
    add_column :stores, :latitude, :float
    add_column :stores, :longitude, :float
  end
end
