require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get bundle" do
    get sessions_bundle_url
    assert_response :success
  end

  test "should get install" do
    get sessions_install_url
    assert_response :success
  end

end
