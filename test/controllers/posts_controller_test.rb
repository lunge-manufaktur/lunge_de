require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin_user)
    @post = posts(:default)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show post" do
    get :show, params: { id: @post }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, params: { post: @post.attributes }
    end
  end

  test "should get edit" do
    get :edit, params: { id: @post }
    assert_response :success
  end

  test "should update post" do
    patch :update, params: {
      id: @post,
      post: @post.attributes
    }
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, params: { id: @post }
    end
    assert_redirected_to posts_path
  end
end
