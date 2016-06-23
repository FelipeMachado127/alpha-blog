require "test_helper"

def setup
  @category = Category.create(name: "sports")
end

class CatergoriesControllerTest < ActionController::testCase
  test "should get categories index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get show" do 
    get(:show, {'id' => @category.id}) 
    assert_response :success
  end
end