require "test_helper"

class PostPolicyTest < PolicyTest
  setup do
    @user = users(:default_user)
    @post = posts(:default_post)
  end

  test "valid user permissions" do
    assert_permit(@user, @post, :index)
    assert_permit(@user, @post, :show)
    assert_permit(@user, @post, :new)
    assert_permit(@user, @post, :create)
    assert_permit(@user, @post, :edit)
    assert_permit(@user, @post, :update)
    assert_permit(@user, @post, :destroy)
  end

  test "guest permissions" do
    assert_permit(nil, @post, :index)
    assert_permit(nil, @post, :show)
    refute_permit(nil, @post, :new)
    refute_permit(nil, @post, :create)
    refute_permit(nil, @post, :edit)
    refute_permit(nil, @post, :update)
    refute_permit(nil, @post, :destroy)
  end
end