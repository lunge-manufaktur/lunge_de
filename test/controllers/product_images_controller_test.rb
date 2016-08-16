require 'test_helper'

class ProductImagesControllerTest < ActionController::TestCase
  setup do
    @product_image = product_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_image" do
    assert_difference('ProductImage.count') do
      post :create, params: { product_image: @product_image.attributes }
    end
  end

  test "should show product_image" do
    get :show, params: { id: @product_image }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @product_image }
    assert_response :success
  end

  test "should update product_image" do
    patch :update, params: {
      id: @product_image,
      product_image: @product_image.attributes
    }
  end

  test "should destroy product_image" do
    assert_difference('ProductImage.count', -1) do
      delete :destroy, params: { id: @product_image }
    end
    assert_redirected_to product_images_path
  end
end