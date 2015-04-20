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

require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  setup do
    @product = products(:default_product)
    @hidden_product = products(:hidden_product)
  end

  test "product should have stock" do
    store_id = stores(:default_store).id
    size = "g8"
    assert @product.has_stock?(store: store_id, size: size), "Doesn't seem to be true"
  end

  test "product should not have stock" do
    store_id = stores(:default_store).id
    size = "g1"
    refute @product.has_stock?(store: store_id, size: size), "Doesn't seem to be false"
  end

end
