class AddSalesOver90DaysToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :sales_over_90_days, :integer
    add_index :products, :sales_over_90_days
  end
end
