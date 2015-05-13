require "test_helper"

class ProductPolicyTest < PolicyTest
  setup do
    @user = users(:default_user)
    @admin = users(:admin_user)
    @product = products(:default_product)
    @hidden_product = products(:hidden_product)
  end

  test "admin permissions" do
    assert_permit(@admin, @product, :index)
    assert_permit(@admin, @product, :show)
    assert_permit(@admin, @product, :new)
    assert_permit(@admin, @product, :create)
    assert_permit(@admin, @product, :edit)
    assert_permit(@admin, @product, :update)
    assert_permit(@admin, @product, :destroy)
  end

  test "valid user permissions" do
    assert_permit(@user, @product, :index)
    assert_permit(@user, @product, :show)
    refute_permit(@user, @product, :new)
    refute_permit(@user, @product, :create)
    refute_permit(@user, @product, :edit)
    refute_permit(@user, @product, :update)
    refute_permit(@user, @product, :destroy)
  end

  test "guest permissions" do
    assert_permit(nil, @product, :index)
    assert_permit(nil, @product, :show)
  end

  test "guest shouldn't be able to see unpublished products" do
    refute_permit(nil, @hidden_product, :show)
  end
end