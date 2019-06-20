# == Schema Information
#
# Table name: store_images
#
#  id                 :integer          not null, primary key
#  store_id           :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  default            :boolean          default(FALSE)
#
# Indexes
#
#  index_store_images_on_default   (default)
#  index_store_images_on_store_id  (store_id)
#

class StoreImage < ActiveRecord::Base
  belongs_to :store

  # scopes
  scope :default, -> { where(default: true) }

  # paperclip
  require "paperclip/storage/ftp"

  Paperclip.interpolates :store_id do |attachment, style|
    attachment.instance.store_id
  end

  has_attached_file :image,
    :styles => {
      :thumb => "300x300>",
      :small => "640x640>",
      :medium => "1024x1024>",
      :large => "2000x2000>",
      :card => "640x640#"
    },
    :convert_options => {
      :thumb => "-quality 75 -strip",
      :small => "-quality 80 -strip",
      :medium => "-quality 80 -strip",
      :large => "-quality 80 -strip",
      :card => "-quality 80 -strip"
    },
    :storage => :ftp,
    :path => "/lunge.de/www/images/:class/:store_id/:store_id_:id_:style.:extension",
    :url => "https://cdn.lunge.de/images/:class/:store_id/:store_id_:id_:style.:extension",
    :ftp_servers => [
      {
        :host     => ENV["FTP_HOST"],
        :user     => ENV["FTP_USER"],
        :password => ENV["FTP_PASSWORD"],
        :passive  => true
      }
    ]

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
