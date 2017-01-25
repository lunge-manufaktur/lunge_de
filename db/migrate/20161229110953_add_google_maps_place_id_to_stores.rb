class AddGoogleMapsPlaceIdToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :google_maps_place_id, :string
  end
end
