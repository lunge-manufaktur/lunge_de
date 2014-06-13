class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true
      t.references :store, index: true
      t.datetime :start_date
      t.datetime :end_date
      t.time :pause
      t.boolean :vacation, default: false
      t.boolean :sick, default: false
      t.text :comment

      t.timestamps
    end
  end
end
