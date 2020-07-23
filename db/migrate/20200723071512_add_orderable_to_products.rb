class AddOrderableToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :orderable, :boolean, default: true, null: false
    add_index :products, :orderable
  end
end
