class ChangeDescriptionInProducts < ActiveRecord::Migration
  def change
  	change_column :products, :description, :text, :default => "Beschreibung folgt"
  end
end
