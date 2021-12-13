class ManagementPortal::MeetingRoomsController < ApplicationController
  before_action :is_management_portal_login?
  
  def index
    @meeting_rooms = MeetingRoom.order(id: :asc).page(1).per(20)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
