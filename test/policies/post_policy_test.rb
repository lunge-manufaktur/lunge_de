require "test_helper"

class PostPolicyTest < PolicyTest
  setup do
    @admin = users(:admin_user)
    @user = users(:default_user)
    @post = posts(:default)
  end

  test "valid admin permissions" do
    assert_permit(@admin, @post, :index)
    assert_permit(@admin, @post, :show)
    assert_permit(@admin, @post, :new)
    assert_permit(@admin, @post, :create)
    assert_permit(@admin, @post, :edit)
    assert_permit(@admin, @post, :update)
    assert_permit(@admin, @post, :destroy)
  end

  test "valid user permissions" do
    assert_permit(@user, @post, :index)
    assert_permit(@user, @post, :show)
    refute_permit(@user, @post, :new)
    refute_permit(@user, @post, :create)
    refute_permit(@user, @post, :edit)
    refute_permit(@user, @post, :update)
    refute_permit(@user, @post, :destroy)
  end

  test "guest permissions" do
    assert_permit(nil, @post, :index)
    assert_permit(nil, @post, :show)
  end
end