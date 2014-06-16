class AddCustomStatusToEvents < ActiveRecord::Migration
  def change
  	change_table :events do |t|
  		t.string :custom_status
  		t.boolean :manager, default: false
  	end
  end
end
