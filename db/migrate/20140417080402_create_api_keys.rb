class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :key
      t.references :user, index: true

      t.timestamps
    end
  end
end
