class AddAttachmentLogoToBrands < ActiveRecord::Migration[4.2]
  def self.up
    change_table :brands do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :brands, :logo
  end
end
