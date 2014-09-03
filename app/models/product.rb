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

  # Associations
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

  # Acts as taggable on gem
  acts_as_taggable

  # Friendly ID
  include FriendlyId
  friendly_id :title, :use => :slugged

  # Scopes
  scope :published, -> { where(is_published: true) }
  scope :on_sale, -> { where("current_price < regular_price") }
  scope :featured, -> { where(is_featured: true) }
  scope :on_frontpage, -> { where(is_on_frontpage: true) }

  # Methods
  include IconHelper

  def title
    "#{self.try(:brand).try(:name)} #{name} #{sku}"
  end 

  def default_image(size=nil)
    if self.product_images.any?
      pi = self.product_images.featured.first || self.product_images.first
      pi.image.url(size)
    else
      case size
      when "full_width"
        ""
      when "large"
        "http://placehold.it/1600&text=Kein+Bild+vorhanden"
      when "medium"
        "http://placehold.it/1024&text=Kein+Bild+vorhanden"
      when "small"
        "http://placehold.it/640&text=Kein+Bild+vorhanden"
      when "thumb"
        "http://placehold.it/300&text=Kein+Bild+vorhanden"
      when "card"
        "http://placehold.it/640&text=Kein+Bild+vorhanden"
      end 
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

  # def has_stock?(store_id, size)
  #   stock = Stock.where(store_id: store_id, product_id: id).first
  #   if eval("stock.#{size}?")
  #     true
  #   else
  #     false
  #   end
  # end

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
end