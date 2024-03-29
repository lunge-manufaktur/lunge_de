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
#  is_exclusive                        :boolean          default(FALSE)
#  is_featured                         :boolean          default(FALSE)
#  is_on_frontpage                     :boolean          default(FALSE)
#  is_on_supersale                     :boolean          default(FALSE)
#  is_published                        :boolean          default(FALSE)
#  meta_description                    :text
#  name                                :string
#  official_description                :text
#  orderable                           :boolean          default(TRUE), not null
#  published_at                        :datetime
#  regular_price                       :decimal(8, 2)
#  sales_over_90_days                  :integer
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
#  index_products_on_is_exclusive         (is_exclusive)
#  index_products_on_is_featured          (is_featured)
#  index_products_on_is_on_frontpage      (is_on_frontpage)
#  index_products_on_is_on_supersale      (is_on_supersale)
#  index_products_on_is_published         (is_published)
#  index_products_on_orderable            (orderable)
#  index_products_on_published_at         (published_at)
#  index_products_on_sales_over_90_days   (sales_over_90_days)
#  index_products_on_size_id              (size_id)
#  index_products_on_slug                 (slug)
#  index_products_on_use_in_lia_campaign  (use_in_lia_campaign)
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
