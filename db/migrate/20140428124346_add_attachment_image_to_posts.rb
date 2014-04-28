class AddAttachmentImageToPosts < ActiveRecord::Migration
  def self.up
    
  end

  def self.down
    drop_attached_file :posts, :image
  end
end
