class CreateProducts < ActiveRecord::Migration
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
