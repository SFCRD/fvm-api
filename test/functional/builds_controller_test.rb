require 'test_helper'

class BuildsControllerTest < ActionController::TestCase
  test "should get index json" do
    get :index, :format => :json
    assert_response :success
  end
  
  test "should get index xml" do
    get :index, :format => :xml
    assert_response :success
  end
end
