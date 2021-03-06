# == Schema Information
#
# Table name: stocks
#
#  id         :bigint           not null, primary key
#  g1         :integer
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
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  store_id   :bigint
#
# Indexes
#
#  index_stocks_on_product_id  (product_id)
#  index_stocks_on_store_id    (store_id)
#

require 'test_helper'

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup :create_stock

  def create_stock
    @stock = Stock.new(product_id: 1, store_id: 1, g10: 2, g10h: 0, g11: nil)
  end

  test "out of stock sizes should be 'Nicht auf Lager'" do
    assert_equal "Nicht auf Lager", @stock.stock_in_words("g10h")
  end

end
