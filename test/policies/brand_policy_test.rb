require "test_helper"

class BrandPolicyTest < PolicyTest
  setup do
    @user = users(:default_user)
    @brand = brands(:default_brand)
  end

  test "valid user permissions" do
    assert_permit(@user, @brand, :index)
    assert_permit(@user, @brand, :show)
    refute_permit(@user, @brand, :new)
    refute_permit(@user, @brand, :create)
    refute_permit(@user, @brand, :edit)
    refute_permit(@user, @brand, :update)
    refute_permit(@user, @brand, :destroy)
  end

  test "guest permissions" do
    assert_permit(nil, @brand, :index)
    assert_permit(nil, @brand, :show)
  end
end