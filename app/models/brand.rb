# == Schema Information
#
# Table name: brands
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Brand < ActiveRecord::Base
	# Associations
	has_many :products

  # FriendlyID
  extend FriendlyId
  friendly_id :name, use: :slugged

	# Paperclip
  require "paperclip/storage/ftp"

  Paperclip.interpolates :name do |attachment, style|
    attachment.instance.name.downcase.tr(" ", "_")
  end

  has_attached_file :logo,
  	:styles => {
  		:thumb => "120x120>",
  		:small => "300x300>",
  		:medium => "500x500>",
  		:large => "1024x1024>"
  	},
    :convert_options => {
      :thumb => "-quality 100 -strip",
      :small => "-quality 100 -strip",
      :medium => "-quality 80 -strip",
      :large => "-quality 80 -strip"
    },
  	:default_url => "/images/:style/missing.png",
  	:storage => :ftp,
  	:path => "/lunge.de/www/images/:class/:name/:name_:id_:style.:extension",
  	:url => "http://www.lunge.de/images/:class/:name/:name_:id_:style.:extension",
  	:ftp_servers => [
      {
        :host     => "www.lunge.de",
        :user     => "webmin@lunge.de",
        :password => "Pegasus#11",
        :passive	=> true
      }
    ]

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	# Scopes
  scope :active, -> { joins(:products).distinct.merge(Product.published) }



end