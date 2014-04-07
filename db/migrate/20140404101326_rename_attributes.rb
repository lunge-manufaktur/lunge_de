class RenameAttributes < ActiveRecord::Migration
  def change
  	rename_table :attributes, :properties
  end
end
