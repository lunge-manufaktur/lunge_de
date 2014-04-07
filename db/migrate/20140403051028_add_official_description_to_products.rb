class AddOfficialDescriptionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :official_description, :text
  end
end