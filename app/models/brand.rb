# == Schema Information
#
# Table name: brands
#
#  id                :bigint           not null, primary key
#  description       :text
#  logo_content_type :string
#  logo_file_name    :string
#  logo_file_size    :bigint
#  logo_updated_at   :datetime
#  name              :string
#  slug              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_brands_on_slug  (slug) UNIQUE
#

class Brand < ActiveRecord::Base
  # Associations
  has_many :products

  # FriendlyID
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Scopes
  scope :active, -> { joins(:products).distinct.merge(Product.published) }
  # scope :active, -> { includes(:products).where(products:{is_published: true}) }
  scope :has_logo, -> { where.not(logo_file_name: nil) }
  scope :ordered_by_name, -> { order(:name) }

  # Paperclip
  require "paperclip/storage/ftp"

  Paperclip.interpolates :name do |attachment, style|
    attachment.instance.name.downcase.tr(" ", "_")
  end

  has_attached_file :logo,
    styles: {
      thumb: "120x120>",
      small: "300x300>",
      medium: "500x500>",
      large: "1024x1024>",
      default_url: ""
    },
    convert_options: {
      thumb: "-quality 100 -strip",
      small: "-quality 100 -strip",
      medium: "-quality 80 -strip",
      large: "-quality 80 -strip"
    },
    storage: :ftp,
    path: "/lunge.de/www/images/:class/:name/:name_:id_:style.:extension",
    url: "https://cdn.lunge.de/images/:class/:name/:name_:id_:style.:extension",
    ftp_servers: [
      {
        host: ENV["FTP_HOST"],
        user: ENV["FTP_USER"],
        password: ENV["FTP_PASSWORD"],
        passive: true
      }
    ]

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  # methods
  def logo_present?
    self.logo.present?
  end
end
