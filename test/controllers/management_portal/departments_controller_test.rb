require 'test_helper'

class ManagementPortal::DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get management_portal_departments_index_url
    assert_response :success
  end

  test "should get create" do
    get management_portal_departments_create_url
    assert_response :success
  end

  test "should get edit" do
    get management_portal_departments_edit_url
    assert_response :success
  end

  test "should get detail" do
    get management_portal_departments_detail_url
    assert_response :success
  end

end
