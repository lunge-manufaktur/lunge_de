require 'test_helper'

class CategorizationsControllerTest < ActionController::TestCase
  setup do
    @categorization = categorizations(:default)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categorization" do
    assert_difference('Categorization.count') do
      post :create, params: {
        categorization: @categorization.attributes
      }
    end
  end

  test "should show categorization" do
    get :show, params: {
      id: @categorization
    }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {
      id: @categorization
    }
    assert_response :success
  end

  test "should update categorization" do
    patch :update, params: {
      id: @categorization,
      categorization: @categorization.attributes
    }
  end

  test "should destroy categorization" do
    assert_difference('Categorization.count', -1) do
      delete :destroy, params: {
        id: @categorization
      }
    end
    assert_redirected_to categorizations_path
  end
end
