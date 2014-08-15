require 'test_helper'

class StocksControllerTest < ActionController::TestCase
  setup do
    @stock = stocks(:one)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:stocks)
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post :create, format: :json, stock: { g1: @stock.g1, product_id: @stock.product_id, store_id: @stock.store_id }
    end
  end

  test "should show stock" do
    get :show, id: @stock, format: :json
    assert_response :success
  end

  test "should update stock" do
    patch :update,
      id: @stock,
      stock: { g1: @stock.g1, product_id: @stock.product_id, store_id: @stock.store_id },
      format: :json
    assert_response :success
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete :destroy, id: @stock
    end

    assert_redirected_to stocks_path
  end
end
