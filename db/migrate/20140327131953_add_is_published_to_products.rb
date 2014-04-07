class AddIsPublishedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_published, :boolean, index: true
    remove_column :products, :published_on
  end
end
