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
#  is_published         :boolean          default(FALSE)
#  official_description :text
#  is_on_sale           :boolean          default(FALSE)
#  is_on_frontpage      :boolean          default(FALSE)
#  is_featured          :boolean          default(FALSE)
#  slug                 :string(255)
#  use_in_lia_campaign  :boolean          default(FALSE)
#  meta_description     :text
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

  # callbacks
  after_validation :hide_unavailable_product, on: [:create, :update]

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
    else
      "missing.png"
    end
  end

  def is_on_sale?
    current_price < regular_price
  end

  def short_description(length=200)
    if meta_description.blank?
      description&.truncate(length, separator: " ")
    else
      meta_description&.truncate(length, separator: " ")
    end
  end

  def name_with_brand
    "#{brand&.name} #{name}"
  end

  def name_with_color
    if color.present?
      "#{name} in #{color.titleize}"
    else
      name
    end
  end

  def name_with_brand_and_color
    if color.present?
      "#{name_with_brand} in #{color.titleize}"
    else
      name_with_brand
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
    store_id = store || [1,3,4,5]
    size = size ||  "COALESCE(g1, 0)
                    +COALESCE(g1h, 0)
                    +COALESCE(g2, 0)
                    +COALESCE(g2h, 0)
                    +COALESCE(g3, 0)
                    +COALESCE(g3h, 0)
                    +COALESCE(g4, 0)
                    +COALESCE(g4h, 0)
                    +COALESCE(g5, 0)
                    +COALESCE(g5h, 0)
                    +COALESCE(g6, 0)
                    +COALESCE(g6h, 0)
                    +COALESCE(g7, 0)
                    +COALESCE(g7h, 0)
                    +COALESCE(g8, 0)
                    +COALESCE(g8h, 0)
                    +COALESCE(g9, 0)
                    +COALESCE(g9h, 0)
                    +COALESCE(g10, 0)
                    +COALESCE(g10h, 0)
                    +COALESCE(g11, 0)
                    +COALESCE(g11h, 0)
                    +COALESCE(g12, 0)
                    +COALESCE(g12h, 0)
                    +COALESCE(g13, 0)
                    +COALESCE(g13h, 0)
                    +COALESCE(g14, 0)
                    +COALESCE(g14h, 0)
                    +COALESCE(g15, 0)
                    +COALESCE(g16, 0)
                    +COALESCE(g17, 0)
                    +COALESCE(g18, 0)
                    +COALESCE(g19, 0)"

    stock = Stock.where(store_id: store_id, product_id: product_id).sum(size)
    
    stock > 0
  end

  def eligible_for_running_course?
    running_shoe_tag = "laufschuh"

    is_running_shoe = self.tags.where(name: running_shoe_tag).any?

    if is_running_shoe && !is_on_sale
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



private
  def hide_unavailable_product
    self.is_published = false unless has_stock?
  end
