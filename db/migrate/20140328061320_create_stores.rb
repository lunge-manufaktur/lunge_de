class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address_name
      t.string :street
      t.string :zip
      t.string :city
      t.string :phone
      t.string :email
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
