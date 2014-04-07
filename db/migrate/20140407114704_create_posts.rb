class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.boolean :is_published

      t.timestamps
    end
  end
end
