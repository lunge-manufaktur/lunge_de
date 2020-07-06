class AddCurrentPriceWithoutTaxReducationToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :current_price_without_tax_reduction, :decimal, precision: 8, scale: 2
  end
end
