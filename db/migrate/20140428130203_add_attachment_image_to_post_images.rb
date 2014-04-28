class AddAttachmentImageToPostImages < ActiveRecord::Migration
  def self.up
    change_table :post_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :post_images, :image
  end
end
