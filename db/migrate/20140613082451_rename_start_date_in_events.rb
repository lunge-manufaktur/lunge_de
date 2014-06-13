class RenameStartDateInEvents < ActiveRecord::Migration
  change_table :events do |t|
  	t.rename :start_date, :starts_at
  	t.rename :end_date, :ends_at
  end
end
