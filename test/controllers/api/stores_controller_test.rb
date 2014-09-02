require 'test_helper'

class Api::StoresControllerTest < ActionController::TestCase
  setup do
    @store = stores(:default_store)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
      post :create, store: @store.attributes, format: :json
    end
  end

  test "should show store" do
    get :show, id: @store, format: :json
    assert_response :success
  end

  test "should update store" do
    patch :update, id: @store, store: @store.attributes, format: :json
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete :destroy, id: @store, format: :json
    end
  end
end
