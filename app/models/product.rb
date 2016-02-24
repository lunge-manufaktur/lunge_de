# == Schema Information
#
# Table name: products
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  sku                  :string(255)
#  description          :text             default("Beschreibung folgt")
#  created_at           :datetime
#  updated_at           :datetime
#  size_id              :integer
#  brand_id             :integer
#  regular_price        :decimal(8, 2)
#  current_price        :decimal(8, 2)
#  color                :string(255)
#  is_published         :boolean
#  official_description :text
#  is_on_sale           :boolean
#  is_on_frontpage      :boolean
#  is_featured          :boolean
#  slug                 :string(255)
#

class Product < ActiveRecord::Base
  # associations
  belongs_to :brand
  belongs_to :size
  belongs_to :product_category
  has_many :product_images
  has_many :stocks, dependent: :destroy
  has_many :stores, through: :stocks
  has_many :properties, dependent: :destroy
  has_many :product_categorizations, dependent: :destroy
  has_many :product_categories, through: :product_categorizations

  accepts_nested_attributes_for :product_images, :allow_destroy => true
  accepts_nested_attributes_for :stocks, :allow_destroy => true
  accepts_nested_attributes_for :properties, :allow_destroy => true

  # acts as taggable on gem
  acts_as_taggable

  # friendly ID
  include FriendlyId
  friendly_id :title, :use => :slugged

  # scopes
  scope :published, -> { where(is_published: true) }
  scope :on_sale, -> { where("current_price < regular_price") }
  scope :featured, -> { where(is_featured: true) }
  scope :on_frontpage, -> { where(is_on_frontpage: true) }
  scope :newest, -> { order(created_at: :desc) }
  scope :has_image, -> { includes(:product_images).where.not(product_images: { id: nil } ) }
  scope :prefer_with_image, -> { includes(:product_images).order('product_images.created_at DESC NULLS LAST') }

  # methods
  include IconHelper

  def title
    "#{self.try(:brand).try(:name)} #{name} #{sku}"
  end

  def meta_keywords
    [self.brand.name, name, sku, color, self.tag_list].join(",")
  end 

  def default_image(size=nil)
    if product_images.exists?
      pi = product_images.featured.first || product_images.first
      pi.image.url(size)
    end
  end

  def is_on_sale?
    current_price < regular_price
  end

  def short_description(length=nil)
    @length = length || 200
    description.truncate(@length, separator: " ") unless description.nil?
  end

  def name_with_brand
    if self.brand
      "#{self.brand.name} #{name}"
    else
      name
    end
  end


  def stock_icon(store, size)
    status = eval("self.stocks.#{store}.#{size}?")
    if status
      inline_icon("", "ion-ios7-checkmark", "limegreen")
    else
      inline_icon("", "ion-ios7-close", "lightgray")
    end
  end

  def has_stock?(store: nil, size: nil)
    product_id = id
    store_id = store || "*"
    size = size

    stock = Stock.where(store_id: store_id, product_id: product_id).first
    if size
      eval("stock.#{size}?")
    else
      stock.quantity > 0
    end
  end

  def eligible_for_running_course?
    running_shoe_tag = "laufschuh"

    is_running_shoe = self.tags.where(name: running_shoe_tag).any?
    is_not_reduced = current_price >= regular_price

    if is_running_shoe && is_not_reduced
      true
    else
      false
    end
  end

  def stock_updated_at
    if stocks.present?
      stocks.maximum(:updated_at).to_time
    end
  end
end