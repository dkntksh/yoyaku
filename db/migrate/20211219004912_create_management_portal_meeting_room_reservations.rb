class CreateManagementPortalMeetingRoomReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :management_portal_meeting_room_reservations do |t|

      t.timestamps
    end
  end
end
