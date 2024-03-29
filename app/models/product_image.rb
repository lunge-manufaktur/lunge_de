# == Schema Information
#
# Table name: product_images
#
#  id                 :bigint           not null, primary key
#  default            :boolean          default(FALSE), not null
#  image              :string
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :bigint
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  product_id         :bigint
#
# Indexes
#
#  index_product_images_on_default     (default)
#  index_product_images_on_product_id  (product_id)
#

class ProductImage < ActiveRecord::Base

  # Associations
  belongs_to :product

  # scopes
  scope :featured, -> { where(default: true) }

  # Paperclip
  require "paperclip/storage/ftp"

  Paperclip.interpolates :product_id do |attachment, style|
    attachment.instance.product_id
  end

  has_attached_file :image,
    styles: {
      thumb: ["300x300#", :jpg],
      small: ["640x640>", :jpg],
      medium: ["1024x1024>", :jpg],
      large: ["2000x2000>", :jpg],
      card: ["640x640#", :jpg]
    },
    default_url: "missing.png",
    convert_options: {
      thumb: "-quality 80 -background white -alpha remove -strip",
      small: "-quality 80 -background white -alpha remove -strip",
      medium: "-quality 80 -background white -alpha remove -strip",
      large: "-quality 80 -background white -alpha remove -strip",
      card: "-quality 80 -background white -alpha remove -strip"
    },
    storage: :ftp,
    path: "/lunge.de/www/images/:class/:product_id/:product_id_:id_:style.:extension",
    url: "https://cdn.lunge.de/images/:class/:product_id/:product_id_:id_:style.:extension",
    ftp_servers: [
      {
        host: ENV["FTP_HOST"],
        user: ENV["FTP_USER"],
        password: ENV["FTP_PASSWORD"],
        passive: true
      }
    ]

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  process_in_background :image

end
