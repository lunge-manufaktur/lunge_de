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
    assert_not_nil assigns(:products)
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:product).new_record?
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @product.attributes
    end
    assert_redirected_to product_path(assigns(:product))
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: @product.attributes
    assert_redirected_to product_path(assigns(:product))
  end

  test "shoudl destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end
    assert_redirected_to products_path
  end
end