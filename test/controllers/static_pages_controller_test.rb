require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  #test "should get home" do
   # get :home
   # assert_response :success
  #end
  test "input" do
    get :input
    assert_equal 302,response.status
  end
end
