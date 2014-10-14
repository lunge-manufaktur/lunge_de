require 'test_helper'

class Api::ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:default_product)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, format: :json, product: { name: @product.name }
    end
  end

  test "should show product" do
    get :show, format: :json, id: @product
    assert_response :success
    assert_not_nil assigns(:product)
  end

  test "should update product" do
    patch :update, format: :json, id: @product, product: { name: @product.attributes }
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, format: :json, id: @product
    end
  end
end
