class AddColumnToMeetingRoomResevationStartEndRevervationDateTime < ActiveRecord::Migration[6.0]
  def change
    remove_column :meeting_room_reservations, :reserve_date_time 
    add_column :meeting_room_reservations, :start_reserve_date_time, :datetime, :null => false
    add_column :meeting_room_reservations, :end_reserve_date_time, :datetime, :null => false
  end
end
