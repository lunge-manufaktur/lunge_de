class AddAttachmentImageToStoreImages < ActiveRecord::Migration[4.2]
  def self.up
    change_table :store_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :store_images, :image
  end
end
