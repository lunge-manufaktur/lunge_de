class AddAttachmentImageToPosts < ActiveRecord::Migration[4.2]
  def self.up
    
  end

  def self.down
    drop_attached_file :posts, :image
  end
end
