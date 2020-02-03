class AddIsOnHomepageToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :is_on_homepage, :boolean, index: true
  end
end
