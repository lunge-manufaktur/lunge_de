class AddIsOnHomepageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_on_homepage, :boolean, index: true
  end
end
