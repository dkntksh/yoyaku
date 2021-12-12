require 'test_helper'

class ManagementPortal::MeetingRoomControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get management_portal_meeting_room_index_url
    assert_response :success
  end

  test "should get new" do
    get management_portal_meeting_room_new_url
    assert_response :success
  end

  test "should get create" do
    get management_portal_meeting_room_create_url
    assert_response :success
  end

  test "should get edit" do
    get management_portal_meeting_room_edit_url
    assert_response :success
  end

  test "should get update" do
    get management_portal_meeting_room_update_url
    assert_response :success
  end

  test "should get show" do
    get management_portal_meeting_room_show_url
    assert_response :success
  end

  test "should get destroy" do
    get management_portal_meeting_room_destroy_url
    assert_response :success
  end

end
