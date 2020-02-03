class CreateApiKeys < ActiveRecord::Migration[4.2]
  def change
    create_table :api_keys do |t|
      t.string :key
      t.references :user, index: true

      t.timestamps
    end
  end
end
