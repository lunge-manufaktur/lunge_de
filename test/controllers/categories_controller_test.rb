require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:default)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, params: { category: @category.attributes }
    end
  end

  test "should show category" do
    get :show, params: { id: @category }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @category }
    assert_response :success
  end

  test "should update category" do
    patch :update, params: {
      id: @category,
      category: @category.attributes
    }
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, params: { id: @category }
    end
    assert_redirected_to categories_path
  end
end
