class RemoveIsOnSaleFromProduct < ActiveRecord::Migration[5.1]
  def change
  	remove_column :products, :is_on_sale
  end
end
