class AddBrandToProducts < ActiveRecord::Migration[4.2]
  def change
    add_reference :products, :brand, index: true
  end
end
