class CreateEmployees < ActiveRecord::Migration[4.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.boolean :active, default: true
      t.integer :user_id

      t.timestamps
    end
    add_index :employees, :active
    add_index :employees, :user_id
  end
end
