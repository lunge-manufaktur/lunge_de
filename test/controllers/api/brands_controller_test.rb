require 'test_helper'

class Api::BrandsControllerTest < ActionController::TestCase
  setup do
    @brand = brands(:asics)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:brands)
  end

  test "should create brand" do
    assert_difference('Brand.count') do
      post :create, format: :json, brand: @brand.attributes
    end
  end

  test "should show brand" do
    get :show, format: :json, id: @brand
    assert_response :success
  end

  test "should update brand" do
    patch :update, format: :json, id: @brand, brand: { name: @brand.name }
  end

  test "should destroy brand" do
    assert_difference('Brand.count', -1) do
      delete :destroy, format: :json, id: @brand
    end
  end
end
