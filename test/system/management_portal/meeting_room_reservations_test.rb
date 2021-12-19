require "application_system_test_case"

class ManagementPortal::MeetingRoomReservationsTest < ApplicationSystemTestCase
  setup do
    @management_portal_meeting_room_reservation = management_portal_meeting_room_reservations(:one)
  end

  test "visiting the index" do
    visit management_portal_meeting_room_reservations_url
    assert_selector "h1", text: "Management Portal/Meeting Room Reservations"
  end

  test "creating a Meeting room reservation" do
    visit management_portal_meeting_room_reservations_url
    click_on "New Management Portal/Meeting Room Reservation"

    click_on "Create Meeting room reservation"

    assert_text "Meeting room reservation was successfully created"
    click_on "Back"
  end

  test "updating a Meeting room reservation" do
    visit management_portal_meeting_room_reservations_url
    click_on "Edit", match: :first

    click_on "Update Meeting room reservation"

    assert_text "Meeting room reservation was successfully updated"
    click_on "Back"
  end

  test "destroying a Meeting room reservation" do
    visit management_portal_meeting_room_reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meeting room reservation was successfully destroyed"
  end
end
