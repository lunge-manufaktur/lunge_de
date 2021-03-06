# == Schema Information
#
# Table name: post_images
#
#  id                 :bigint           not null, primary key
#  default            :boolean
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :bigint
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  post_id            :bigint
#
# Indexes
#
#  index_post_images_on_post_id  (post_id)
#

class PostImage < ActiveRecord::Base
  # Associations
  belongs_to :post

  # scopes
  scope :default, -> { where(default: true) }
  scope :svg, -> { where(image_content_type: "image/svg+xml").first }
  scope :jpg, -> { where(image_content_type: "image/jpeg").first }

  # Paperclip
  require "paperclip/storage/ftp"

  Paperclip.interpolates :post_id do |attachment, style|
    attachment.instance.post_id
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
  	:path => "/lunge.de/www/images/:class/:post_id/:post_id_:id_:style.:extension",
  	:url => "https://cdn.lunge.de/images/:class/:post_id/:post_id_:id_:style.:extension",
  	:ftp_servers => [
      {
        :host     => ENV["FTP_HOST"],
        :user     => ENV["FTP_USER"],
        :password => ENV["FTP_PASSWORD"],
        :passive	=> true
      }
    ]

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
