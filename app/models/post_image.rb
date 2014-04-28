# == Schema Information
#
# Table name: post_images
#
#  id                 :integer          not null, primary key
#  post_id            :integer
#  default            :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class PostImage < ActiveRecord::Base
  # Associations
  belongs_to :post

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
  		:large => "1600x1600>",
  		:full_width => "2000x400#",
      :card => "640x640#"
  	},
    :convert_options => {
      :thumb => "-quality 75 -strip",
      :small => "-quality 80 -strip",
      :medium => "-quality 80 -strip",
      :large => "-quality 90 -strip",
      :full_width => "-quality 90 -strip",
      :card => "-quality 80 -strip"
    },
  	:default_url => "/images/:style/missing.png",
  	:storage => :ftp,
  	:path => "/lunge.de/www/images/:class/:post_id/:post_id_:id_:style.:extension",
  	:url => "http://www.lunge.de/images/:class/:post_id/:post_id_:id_:style.:extension",
  	:ftp_servers => [
      {
        :host     => "www.lunge.de",
        :user     => "webmin@lunge.de",
        :password => "Pegasus#11",
        :passive	=> true
      }
    ]

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
