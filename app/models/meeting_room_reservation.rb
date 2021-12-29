class MeetingRoomReservation < ApplicationRecord
  belongs_to :meeting_room
  belongs_to :reserve_user , class_name: "User", foreign_key: 'reserve_user_id'
end
