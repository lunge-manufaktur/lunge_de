class CreateProducts < ActiveRecord::Migration[4.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :fmid
      t.string :sku
      t.text :description

      t.timestamps
    end
  end
end
