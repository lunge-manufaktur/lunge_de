require 'test_helper'


class Api::StocksControllerTest < ActionController::TestCase

  setup do
    @stock = stocks(:default_stock)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:stocks)
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post :create, format: :json, stock: @stock.attributes
    end
  end

  test "should show stock" do
    get :show, id: @stock, format: :json
    assert_response :success
    assert_not_nil assigns(:stock)
  end

  test "should update stock" do
    patch :update,
      id: @stock,
      stock: @stock.attributes,
      format: :json
    assert_response :success
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete :destroy, id: @stock, format: :json
    end
  end

end
