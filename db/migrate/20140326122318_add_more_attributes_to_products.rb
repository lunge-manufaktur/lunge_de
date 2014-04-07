class AddMoreAttributesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :published_on, :timestamp
    add_column :products, :regular_price, :decimal, precision: 8, scale: 2
    add_column :products, :current_price, :decimal, precision: 8, scale: 2
    add_column :products, :color, :string
  end
end
