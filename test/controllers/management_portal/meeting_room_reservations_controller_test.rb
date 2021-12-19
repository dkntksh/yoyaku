require 'test_helper'

class ManagementPortal::MeetingRoomReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @management_portal_meeting_room_reservation = management_portal_meeting_room_reservations(:one)
  end

  test "should get index" do
    get management_portal_meeting_room_reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_management_portal_meeting_room_reservation_url
    assert_response :success
  end

  test "should create management_portal_meeting_room_reservation" do
    assert_difference('ManagementPortal::MeetingRoomReservation.count') do
      post management_portal_meeting_room_reservations_url, params: { management_portal_meeting_room_reservation: {  } }
    end

    assert_redirected_to management_portal_meeting_room_reservation_url(ManagementPortal::MeetingRoomReservation.last)
  end

  test "should show management_portal_meeting_room_reservation" do
    get management_portal_meeting_room_reservation_url(@management_portal_meeting_room_reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_management_portal_meeting_room_reservation_url(@management_portal_meeting_room_reservation)
    assert_response :success
  end

  test "should update management_portal_meeting_room_reservation" do
    patch management_portal_meeting_room_reservation_url(@management_portal_meeting_room_reservation), params: { management_portal_meeting_room_reservation: {  } }
    assert_redirected_to management_portal_meeting_room_reservation_url(@management_portal_meeting_room_reservation)
  end

  test "should destroy management_portal_meeting_room_reservation" do
    assert_difference('ManagementPortal::MeetingRoomReservation.count', -1) do
      delete management_portal_meeting_room_reservation_url(@management_portal_meeting_room_reservation)
    end

    assert_redirected_to management_portal_meeting_room_reservations_url
  end
end
