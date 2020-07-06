# == Schema Information
#
# Table name: stores
#
#  id                   :bigint           not null, primary key
#  name                 :string
#  address_name         :string
#  street               :string
#  zip                  :string
#  city                 :string
#  phone                :string
#  email                :string
#  active               :boolean          default(TRUE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  latitude             :float
#  longitude            :float
#  description          :text
#  slug                 :string
#  google_maps_place_id :string
#  panorama_embed_url   :text
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
