# == Schema Information
#
# Table name: products
#
#  id                                  :integer          not null, primary key
#  name                                :string
#  fmid                                :integer
#  sku                                 :string
#  description                         :text             default("Beschreibung folgt")
#  created_at                          :datetime
#  updated_at                          :datetime
#  size_id                             :integer
#  brand_id                            :bigint
#  regular_price                       :decimal(8, 2)
#  current_price                       :decimal(8, 2)
#  color                               :string
#  is_published                        :boolean          default(FALSE)
#  official_description                :text
#  is_on_frontpage                     :boolean          default(FALSE)
#  is_featured                         :boolean          default(FALSE)
#  slug                                :string
#  use_in_lia_campaign                 :boolean          default(FALSE)
#  meta_description                    :text
#  current_price_without_tax_reduction :decimal(8, 2)
#  orderable                           :boolean          default(TRUE), not null
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
