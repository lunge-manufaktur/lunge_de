class AddIsOnSupersaleToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :is_on_supersale, :boolean, default: false
    add_index :products, :is_on_supersale
  end
end
