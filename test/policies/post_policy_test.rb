require "test_helper"

class PostPolicyTest < PolicyTest

  setup do
    @user = users(:default_user),
    @post = posts(:default_post)
    @available_actions = [
      :index,
      :show,
      :new,
      :create,
      :edit,
      :update,
      :destroy
    ]
  end

  test "guest user" do
    assert_permissions("Guest", @post, @available_actions,
      index: true,
      show: true,
      new: false,
      create: false,
      edit: false,
      update: false,
      destroy: false
    )
  end

end