require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get home_login_url
    assert_response :success
  end

  test "should get register" do
    get home_register_url
    assert_response :success
  end

end
