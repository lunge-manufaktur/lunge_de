require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  setup do
    @product = products(:default_product)
  end

  test "product should have stock" do
    store_id = stores(:default_store).id
    size = "g8"
    assert @product.has_stock?(store: store_id, size: size), "Doesn't seem to be true"
  end

  test "product should not have stock" do
    store_id = stores(:default_store).id
    size = "g1"
    assert @product.has_stock?(store: store_id, size: size), "Doesn't seem to be false"
  end

end
