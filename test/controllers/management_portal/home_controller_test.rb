require 'test_helper'

class ManagementPortal::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get management_portal_home_index_url
    assert_response :success
  end

end
