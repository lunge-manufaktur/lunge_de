# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  product_id :integer
#  store_id   :integer
#  g1         :integer
#  g1h        :integer
#  g2         :integer
#  g2h        :integer
#  g3         :integer
#  g3h        :integer
#  g4         :integer
#  g4h        :integer
#  g5         :integer
#  g5h        :integer
#  g6         :integer
#  g6h        :integer
#  g7         :integer
#  g7h        :integer
#  g8         :integer
#  g8h        :integer
#  g9         :integer
#  g9h        :integer
#  g10        :integer
#  g10h       :integer
#  g11        :integer
#  g11h       :integer
#  g12        :integer
#  g12h       :integer
#  g13        :integer
#  g13h       :integer
#  g14        :integer
#  g14h       :integer
#  g15        :integer
#  g16        :integer
#  g17        :integer
#  g18        :integer
#  g19        :integer
#  created_at :datetime
#  updated_at :datetime
#

class Stock < ActiveRecord::Base

	# Associations

  belongs_to :product
  belongs_to :store

  # Scopes

  scope :store, ->(store_id) { where("store_id = ?", store_id) }
  scope :product, ->(product_id) { where("product_id = ?", product_id) }
  scope :order_by_store, -> { order(:store_id) }
  scope :in_stock, -> { where(:quantity => true) }

  # Methods

  include IconHelper

  def quantity_array
    quantity_array = [g1, g1h, g2, g2h, g3, g3h, g4, g4h, g5, g5h, g6, g6h, g7, g7h, g8, g8h, g9, g9h, g10, g10h, g11, g11h, g12, g12h, g13, g13h, g14, g14h, g15, g16, g17, g18, g19]
  end



  def sizes_array
    sizes_array = [
      "g1",
      "g1h",
      "g2",
      "g2h",
      "g3",
      "g3h",
      "g4",
      "g4h",
      "g5",
      "g5h",
      "g6",
      "g6h",
      "g7",
      "g7h",
      "g8",
      "g8h",
      "g9",
      "g9h",
      "g10",
      "g10h",
      "g11",
      "g11h",
      "g12",
      "g12h",
      "g13",
      "g13h",
      "g14",
      "g14h",
      "g15",
      "g16",
      "g17",
      "g18",
      "g19"
    ]
  end


  def sizes_hash
    sizes_hash = {
      "g1" => self.product.size.g1,
      "g1h" => self.product.size.g1h,
      "g2" => self.product.size.g2,
      "g2h" => self.product.size.g2h,
      "g3" => self.product.size.g3,
      "g3h" => self.product.size.g3h,
      "g4" => self.product.size.g4,
      "g4h" => self.product.size.g4h,
      "g5" => self.product.size.g5,
      "g5h" => self.product.size.g5h,
      "g6" => self.product.size.g6,
      "g6h" => self.product.size.g6h,
      "g7" => self.product.size.g7,
      "g7h" => self.product.size.g7h,
      "g8" => self.product.size.g8,
      "g8h" => self.product.size.g8h,
      "g9" => self.product.size.g9,
      "g9h" => self.product.size.g9h,
      "g10" => self.product.size.g10,
      "g10h" => self.product.size.g10h,
      "g11" => self.product.size.g11,
      "g11h" => self.product.size.g11h,
      "g12" => self.product.size.g12,
      "g12h" => self.product.size.g12h,
      "g13" => self.product.size.g13,
      "g13h" => self.product.size.g13h,
      "g14" => self.product.size.g14,
      "g14h" => self.product.size.g14h,
      "g15" => self.product.size.g15,
      "g16" => self.product.size.g16,
      "g17" => self.product.size.g17,
      "g18" => self.product.size.g18,
      "g19" => self.product.size.g19
    }
  end



  def quantity
    quantity_array.compact.sum
  end



  def self.l
  	self.where(store_id: 1).first
  end

  def self.f
    self.where(store_id: 3).first
  end

  def self.s
    self.where(store_id: 4).first
  end

  def self.b1
    self.where(store_id: 5).first
  end

  def has_stock?(size)
    send(size).to_i > 0
  end

  def status_hash
  	sizes = sizes_array
  	h = Hash.new

    sizes.each do |key|
      h[key] = self.eval("key")
  	end

    h
  end

end
