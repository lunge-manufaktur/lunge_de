class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.references :post, index: true
      t.boolean :default

      t.timestamps
    end
  end
end
