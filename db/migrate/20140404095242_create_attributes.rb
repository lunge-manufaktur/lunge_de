class CreateAttributes < ActiveRecord::Migration[4.2]
  def change
    create_table :attributes do |t|
      t.integer :product_id
      t.string :name
      t.string :value

      t.timestamps
    end
    add_index :attributes, :product_id
  end
end
