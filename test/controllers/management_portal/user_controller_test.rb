require 'test_helper'

class ManagementPortal::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get management_portal_user_show_url
    assert_response :success
  end

end
