require 'test_helper'

class SizesControllerTest < ActionController::TestCase
  setup do
    @size = sizes(:default)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create size" do
    assert_difference('Size.count') do
      post :create, params: { size: @size.attributes }
    end
  end

  test "should show size" do
    get :show, params: { id: @size }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @size }
    assert_response :success
  end

  test "should update size" do
    patch :update, params: { id: @size, size: @size.attributes }
  end

  test "should destroy size" do
    assert_difference('Size.count', -1) do
      delete :destroy, params: { id: @size }
    end
    assert_redirected_to sizes_path
  end
end
