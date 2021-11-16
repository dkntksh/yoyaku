require 'test_helper'

class ManagementPortal::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get management_portal_login_index_url
    assert_response :success
  end

end
