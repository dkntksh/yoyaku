class ManagementPortal::MeetingRoomsController < ApplicationController
  before_action :is_management_portal_login?
  
  def index
    @meeting_rooms = MeetingRoom.order(id: :asc).page(1).per(20)
  end

  def new
    @meeting_room = MeetingRoom.new
  end

  def create
    begin
      @meeting_room = MeetingRoom.new(meeting_room_params)
      if @meeting_room.invalid?
       Rails.logger.error 'valid error'
       Rails.logger.error @meeting_room.errors.full_messages
       render management_portal_meeting_room_new_path and return
     end
      @meeting_room.save!
     rescue ActiveRecord::RecordInvalid
       Rails.logger.error 'ActiveRecord::RecordInvalid error'
       Rails.logger.error @meeting_room.errors
       render management_portal_meeting_room_new_path and return
     rescue => e
       Rails.logger.error 'other error'
       Rails.logger.error e.message
       Rails.logger.error e.backtrace
       render management_portal_meeting_room_new_path and return
     end
     redirect_to management_portal_meeting_room_path(@meeting_room.id)
  end

  def edit
    @meeting_room = MeetingRoom.find(params[:id])
  end

  def update
    begin
      @meeting_room = MeetingRoom.find_or_initialize_by(id: params[:id])
      unless @meeting_room.update_attributes(meeting_room_params)
        Rails.logger.error 'valid error'
        Rails.logger.error @meeting_room.errors.full_messages
        render management_portal_meeting_room_new_path and return
      end
      @meeting_room.save!
     rescue ActiveRecord::RecordInvalid
       Rails.logger.error 'ActiveRecord::RecordInvalid error'
       Rails.logger.error @meeting_room.errors
       render management_portal_meeting_room_new_path and return
     rescue => e
       Rails.logger.error 'other error'
       Rails.logger.error e.message
       Rails.logger.error e.backtrace
       render management_portal_meeting_room_new_path and return
     end
     redirect_to management_portal_meeting_room_path(@meeting_room.id)
  end

  def show
    @meeting_room = MeetingRoom.find(params[:id])
  end

  def destroy
    Rails.logger.debug "!!!!!destroy user!!!!!"
    meeting_room = MeetingRoom.find(params[:id])
    meeting_room.destroy!
    redirect_to management_portal_meeting_rooms_path notice: '会議室を削除しました。'
  end

  private
  def meeting_room_params
    params.require(:meeting_room).permit(:id, :name, :place)
  end
end
