class RenameUserIDinEvents < ActiveRecord::Migration[4.2]
  def change
  	change_table :events do |t|
  		t.rename :user_id, :employee_id
  	end
  end
end
