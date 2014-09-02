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
