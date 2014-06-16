class RenameUserIDinEvents < ActiveRecord::Migration
  def change
  	change_table :events do |t|
  		t.rename :user_id, :employee_id
  	end
  end
end
