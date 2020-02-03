class AddSlugToStore < ActiveRecord::Migration[4.2]
  def change
    add_column :stores, :slug, :string
    add_index :stores, :slug, unique: true
  end
end
