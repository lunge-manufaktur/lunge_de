require "test_helper"

class BrandPolicyTest < PolicyTest
  setup do
    @user = users(:default_user)
    @brand = brands(:default_brand)
  end

  test "valid user permissions" do
    assert_permit(@user, @brand, :index)
    assert_permit(@user, @brand, :show)
    assert_permit(@user, @brand, :new)
    assert_permit(@user, @brand, :create)
    assert_permit(@user, @brand, :edit)
    assert_permit(@user, @brand, :update)
    assert_permit(@user, @brand, :destroy)
  end

  test "guest permissions" do
    assert_permit(nil, @brand, :index)
    assert_permit(nil, @brand, :show)
    refute_permit(nil, @brand, :new)
    refute_permit(nil, @brand, :create)
    refute_permit(nil, @brand, :edit)
    refute_permit(nil, @brand, :update)
    refute_permit(nil, @brand, :destroy)
  end
end