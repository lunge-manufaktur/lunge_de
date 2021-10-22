# == Schema Information
#
# Table name: stores
#
#  id                   :bigint           not null, primary key
#  active               :boolean          default(TRUE)
#  address_name         :string
#  city                 :string
#  description          :text
#  email                :string
#  frontend_url         :string
#  latitude             :float
#  longitude            :float
#  name                 :string
#  panorama_embed_url   :text
#  phone                :string
#  slug                 :string
#  street               :string
#  zip                  :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  google_maps_place_id :string
#
# Indexes
#
#  index_stores_on_slug  (slug) UNIQUE
#

class Store < ActiveRecord::Base

  # associations
  has_many :stocks
  has_many :products, through: :stocks
  has_many :events
  has_many :store_images, dependent: :destroy

  accepts_nested_attributes_for :store_images, allow_destroy: true

  #friendly id
  include FriendlyId
  friendly_id :title, :use => :slugged

  # geocoder
  geocoded_by :full_address

  # callbacks
  # Don't geocode for now, use rake task instead
  # after_validation :geocode


  # scopes
  scope :active, -> { where(active: true) }
  scope :hamburg, -> { where(city: "Hamburg") }
  scope :berlin, -> { where(city: "Berlin") }
  scope :bismarck, -> { where(name: "Bismarckstraße").first }

  # methods

  def title
    "#{city}/#{street}"
  end

  def full_address
    "#{address_name}, #{street}, #{zip} #{city}"
  end

  def default_image(size: :thumb)
    if store_images.exists?
      store_images&.default&.first&.image&.url(size) || store_images&.first&.image&.url(size)
    else
      "missing.png"
    end
  end

  def short_name
    case id
    when 1
      "l"
    when 2
      "c"
    when 3
      "f"
    when 4
      "s"
    when 5
      "b1"
    when 6
      "m"
    end
  end

end
