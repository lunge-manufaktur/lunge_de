class AddOfficialDescriptionToProducts < ActiveRecord::Migration[4.2]
  def change
    add_column :products, :official_description, :text
  end
end
