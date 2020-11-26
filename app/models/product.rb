# == Schema Information
#
# Table name: products
#
#  id                                  :integer          not null, primary key
#  color                               :string
#  current_price                       :decimal(8, 2)
#  current_price_without_tax_reduction :decimal(8, 2)
#  description                         :text             default("Beschreibung folgt")
#  fmid                                :integer
#  is_archived                         :boolean          default(FALSE)
#  is_featured                         :boolean          default(FALSE)
#  is_on_frontpage                     :boolean          default(FALSE)
#  is_published                        :boolean          default(FALSE)
#  meta_description                    :text
#  name                                :string
#  official_description                :text
#  orderable                           :boolean          default(TRUE), not null
#  regular_price                       :decimal(8, 2)
#  sku                                 :string
#  slug                                :string
#  use_in_lia_campaign                 :boolean          default(FALSE)
#  created_at                          :datetime
#  updated_at                          :datetime
#  brand_id                            :bigint
#  size_id                             :integer
#
# Indexes
#
#  index_products_on_brand_id             (brand_id)
#  index_products_on_is_archived          (is_archived)
#  index_products_on_orderable            (orderable)
#  index_products_on_size_id              (size_id)
#  index_products_on_slug                 (slug)
#  index_products_on_use_in_lia_campaign  (use_in_lia_campaign)
#

class Product < ActiveRecord::Base
  # associations
  belongs_to :brand
  belongs_to :size
  has_many :product_images
  has_many :stocks, dependent: :destroy
  has_many :stores, through: :stocks
  has_many :properties, dependent: :destroy

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
  scope :draft, -> { where(is_published: false) }
  scope :on_sale, -> { where("current_price_without_tax_reduction < regular_price") }
  scope :featured, -> { where(is_featured: true) }
  scope :prefer_featured, -> { order("is_featured DESC NULLS LAST") }
  scope :on_frontpage, -> { where(is_on_frontpage: true) }
  scope :newest, -> { order(created_at: :desc) }
  scope :has_image, -> { joins("JOIN product_images ON products.id = product_images.product_id") }
  scope :has_no_image, -> { joins("LEFT OUTER JOIN product_images ON products.id = product_images.product_id").where(product_images: { id: nil }) }
  scope :prefer_with_image, -> { includes(:product_images).order('product_images.product_id DESC NULLS LAST') }
  scope :has_stock, -> { joins(:stocks).group("products.id").having("sum(COALESCE(g1, 0)+COALESCE(g1h, 0)+COALESCE(g2, 0)+COALESCE(g2h, 0)+COALESCE(g3, 0)+COALESCE(g3h, 0)+COALESCE(g4, 0)+COALESCE(g4h, 0)+COALESCE(g5, 0)+COALESCE(g5h, 0)+COALESCE(g6, 0)+COALESCE(g6h, 0)+COALESCE(g7, 0)+COALESCE(g7h, 0)+COALESCE(g8, 0)+COALESCE(g8h, 0)+COALESCE(g9, 0)+COALESCE(g9h, 0)+COALESCE(g10, 0)+COALESCE(g10h, 0)+COALESCE(g11, 0)+COALESCE(g11h, 0)+COALESCE(g12, 0)+COALESCE(g12h, 0)+COALESCE(g13, 0)+COALESCE(g13h, 0)+COALESCE(g14, 0)+COALESCE(g14h, 0)+COALESCE(g15, 0)+COALESCE(g16, 0)+COALESCE(g17, 0)+COALESCE(g18, 0)+COALESCE(g19, 0)) > 0") }

  # callbacks
  after_validation :hide_unavailable_product, on: [:create, :update]

  # ransack
  

  # methods
  include IconHelper

  def title
    "#{self.try(:brand).try(:name)} #{name} #{sku}"
  end

  def meta_keywords
    [self.brand.name, name, sku, color, self.tag_list].join(",")
  end 

  def default_image(size=nil)
    pi = product_images&.where(default: true)&.first&.image&.url(size) || product_images&.first&.image&.url(size) || "missing.png"
  end

  def is_on_sale?
    current_price_without_tax_reduction < regular_price
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
      "#{name} (#{color.titleize})"
    else
      name
    end
  end

  def name_with_brand_and_color
    if color.present?
      "#{name_with_brand} (#{color.titleize})"
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

  def available_online?
    orderable? && has_stock?(store: 1)
  end

  def eligible_for_running_course?
    running_shoe_tag = "laufschuh"

    is_running_shoe = tags.where(name: running_shoe_tag).any?

    if is_running_shoe && !is_on_sale?
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

  private

  def hide_unavailable_product
    self.is_published = false unless has_stock?
  end

  def self.ransackable_scopes(auth_object = nil)
    [:on_sale, :has_no_image, :has_image, :published, :draft, :on_frontpage, :has_stock, :featured]
  end

end
