require 'test_helper'


class Api::StocksControllerTest < ActionController::TestCase

  setup do
    @stock = stocks(:default_stock)
    authenticate(admin: true)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post :create, format: :json, params: { stock: { g1: @stock.g1 } }
    end
    assert_response :success
  end

  test "should show stock" do
    get :show, format: :json, params: { id: @stock }
    assert_response :success
  end

  test "should update stock" do
    patch :update, format: :json, params: {
      id: @stock,
      stock: { g1: @stock.g1 }
    }
    assert_response :success
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete :destroy, format: :json, params: { id: @stock }
    end
  end

end
