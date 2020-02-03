class AddCustomStatusToEvents < ActiveRecord::Migration[4.2]
  def change
  	change_table :events do |t|
  		t.string :custom_status
  		t.boolean :manager, default: false
  	end
  end
end
