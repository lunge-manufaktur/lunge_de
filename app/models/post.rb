# == Schema Information
#
# Table name: posts
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  subtitle          :string(255)
#  content           :text
#  is_published      :boolean
#  created_at        :datetime
#  updated_at        :datetime
#  slug              :string(255)
#  is_on_homepage    :boolean
#  icon_file_name    :string(255)
#  icon_content_type :string(255)
#  icon_file_size    :integer
#  icon_updated_at   :datetime
#  is_featured       :boolean
#  meta_description  :text
#
# Indexes
#
#  index_posts_on_is_featured  (is_featured)
#  index_posts_on_slug         (slug)
#

class Post < ActiveRecord::Base

  # Associations
  has_many :categories, through: :categorizations
  has_many :categorizations
  has_many :post_images

  accepts_nested_attributes_for :categories, :categorizations
  accepts_nested_attributes_for :post_images, :allow_destroy => true

  # Friendly ID
  include FriendlyId
  friendly_id :title, :use => :slugged

  # Scopes
  scope :published, -> { where(is_published: true) }
  scope :featured, -> { where(is_featured: true) }
  scope :homepage, -> { where(is_on_homepage: true) }

  # Paperclip
  require "paperclip/storage/ftp"
  has_attached_file :icon,
    storage: :ftp,
    path: "/lunge.de/www/images/PostImage/:id/:id.:extension",
    url: "http://cdn.lunge.de/images/PostImage/:id/:id.:extension",
    ftp_servers: [
      {
        :host     => ENV["FTP_HOST"],
        :user     => ENV["FTP_USER"],
        :password => ENV["FTP_PASSWORD"],
        :passive  => true
      }
    ]

  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

  # Methods
  def short_description(length=200)
    meta_description&.truncate(length, separator: " ") || content&.truncate(length, separator: " ")
  end

  def default_image(size: :large)
    if post_images.any?
      post_images.first.image.url(size)
    else
      "missing.png"
    end
  end

end
