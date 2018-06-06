require 'test_helper'

class Api::ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:default_product)
    authenticate(admin: true)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, format: :json, params: { product: { name: @product.name, brand_id: @product.brand_id, size_id: @product.size_id } }
    end
  end

  test "should show product" do
    get :show, format: :json, params: { id: @product }
    assert_response :success
  end

  test "should update product" do
    patch :update, format: :json, params: {
      id: @product,
      product: @product.attributes
    }
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, format: :json, params: { id: @product }
    end
  end
end
