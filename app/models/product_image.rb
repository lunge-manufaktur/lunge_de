# == Schema Information
#
# Table name: product_images
#
#  id                 :integer          not null, primary key
#  product_id         :integer
#  created_at         :datetime
#  updated_at         :datetime
#  default            :boolean          default(FALSE), not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class ProductImage < ActiveRecord::Base

	# Associations
  belongs_to :product

  # Paperclip
  require "paperclip/storage/ftp"

  Paperclip.interpolates :product_id do |attachment, style|
    attachment.instance.product_id
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
  	:default_url => "/images/:style/missing.png",
  	:storage => :ftp,
  	:path => "/lunge.de/www/images/:class/:product_id/:product_id_:id_:style.:extension",
  	:url => "http://www.lunge.de/images/:class/:product_id/:product_id_:id_:style.:extension",
  	:ftp_servers => [
      {
        :host     => "www.lunge.de",
        :user     => "webmin@lunge.de",
        :password => "Pegasus#11",
        :passive	=> true
      }
    ]

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  # Scopes
  scope :featured, -> { where(default: true) }

end
