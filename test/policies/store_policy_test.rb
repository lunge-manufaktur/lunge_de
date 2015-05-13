require "test_helper"

class StorePolicyTest < PolicyTest
  setup do
    @user = users(:default_user)
    @admin = users(:admin_user)
    @store = stores(:default_store)
  end

  test "admin permissions" do
    assert_permit(@admin, @store, :index)
    assert_permit(@admin, @store, :show)
    assert_permit(@admin, @store, :new)
    assert_permit(@admin, @store, :create)
    assert_permit(@admin, @store, :edit)
    assert_permit(@admin, @store, :update)
    assert_permit(@admin, @store, :destroy)
  end

  test "user permissions" do
    assert_permit(@user, @store, :index)
    assert_permit(@user, @store, :show)
    refute_permit(@user, @store, :new)
    refute_permit(@user, @store, :create)
    refute_permit(@user, @store, :edit)
    refute_permit(@user, @store, :update)
    refute_permit(@user, @store, :destroy)
  end

  test "guest permissions" do
    assert_permit(nil, @store, :index)
    assert_permit(nil, @store, :show)
  end
end