require "test_helper"

class Api::SizesControllerTest < ActionController::TestCase

  setup do
    @size = sizes(:default)
    authenticate(admin: true)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show single size" do
    get :show, format: :json, params: { id: @size }
    assert_response :success
  end

  test "should create size" do
    assert_difference "Size.count" do
      post :create, format: :json, params: { size: { name: @size.name } }
    end
  end

  test "should update size" do
    patch :update, format: :json, params: { id: @size, size: { name: @size.name } }
    assert_response :success
  end

  test "should destroy size" do
    assert_difference "Size.count", -1 do
      delete :destroy, format: :json, params: { id: @size }
    end
  end

end