class RenameAttributes < ActiveRecord::Migration[4.2]
  def change
  	rename_table :attributes, :properties
  end
end
