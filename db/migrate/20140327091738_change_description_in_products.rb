class ChangeDescriptionInProducts < ActiveRecord::Migration[4.2]
  def change
  	change_column :products, :description, :text, :default => "Beschreibung folgt"
  end
end
