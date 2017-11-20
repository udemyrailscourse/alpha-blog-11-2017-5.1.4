require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end
  
  test "should get categories index" do
    get categories_path
    assert_response :success
  end
  
  test "should get new" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end
  
  test "should get show" do
    get category_path(@category)
    assert_response :success
  end
  
  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: "sports" } }
    end
    assert_redirected_to categories_path
  end
end