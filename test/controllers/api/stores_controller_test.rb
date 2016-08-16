require 'test_helper'

class Api::StoresControllerTest < ActionController::TestCase
  setup do
    @store = stores(:default_store)
    authenticate(admin: true)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
      post :create, format: :json, params: { store: { name: @store.attributes } }
    end
    assert_response :success
  end

  test "should show store" do
    get :show, format: :json, params: { id: @store }
    assert_response :success
  end

  test "should update store" do
    patch :update, format: :json, params: {
      id: @store,
      store: { name: @store.attributes }
    }
    assert_response :success
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete :destroy, format: :json, params: { id: @store }
    end
  end
end
