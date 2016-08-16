require "test_helper"

class ProductsControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin_user)
    @product = products(:default_product)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show product" do
    get :show, params: { id: @product }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, params: { product: @product.attributes }
    end
  end

  test "should get edit" do
    get :edit, params: { id: @product }
    assert_response :success
  end

  test "should update product" do
    patch :update, params: {
      id: @product,
      product: @product.attributes
    }
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, params: { id: @product }
    end
    assert_redirected_to products_path
  end
end