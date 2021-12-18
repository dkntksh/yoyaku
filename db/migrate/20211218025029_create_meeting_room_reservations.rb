class CreateMeetingRoomReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :meeting_room_reservations do |t|
      t.integer :meeting_room_id, :null => false
      t.datetime :reserve_date_time, :null => false
      t.integer :reserve_user_id, :null => false
      t.integer :number_of_people, :null => false
      t.string :memo

      t.timestamps
    end
  end
end
