require "test_helper"

class ProductPolicyTest < PolicyTest
  setup do
    @user = users(:default_user)
    @product = products(:default_product)
    @hidden_product = products(:hidden_product)
  end

  test "valid user permissions" do
    assert_permit(@user, @product, :index)
    assert_permit(@user, @product, :show)
    assert_permit(@user, @product, :new)
    assert_permit(@user, @product, :create)
    assert_permit(@user, @product, :edit)
    assert_permit(@user, @product, :update)
    assert_permit(@user, @product, :destroy)
  end

  test "guest permissions" do
    assert_permit(nil, @product, :index)
    assert_permit(nil, @product, :show)
    refute_permit(nil, @product, :new)
    refute_permit(nil, @product, :create)
    refute_permit(nil, @product, :edit)
    refute_permit(nil, @product, :update)
    refute_permit(nil, @product, :destroy)
  end

  test "guest shouldn't be able to see unpublished products" do
    refute_permit(nil, @hidden_product, :show)
  end
end