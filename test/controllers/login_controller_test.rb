require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "test index" do
    get :index
    assert_equal 200,response.status
  end
end
