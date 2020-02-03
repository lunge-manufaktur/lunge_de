class RenameStartDateInEvents < ActiveRecord::Migration[4.2]
  change_table :events do |t|
  	t.rename :start_date, :starts_at
  	t.rename :end_date, :ends_at
  end
end
