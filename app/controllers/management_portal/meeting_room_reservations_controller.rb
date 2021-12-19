class ManagementPortal::MeetingRoomReservationsController < ApplicationController
  before_action :is_management_portal_login?
  before_action :set_meeting_room_reservation, only: %i[ show edit update destroy ]

  # GET /management_portal/meeting_room_reservations or /management_portal/meeting_room_reservations.json
  def index
    @meeting_room_reservations = MeetingRoomReservation.order(id: :asc).page(1).per(20)
  end

  # GET /management_portal/meeting_room_reservations/1 or /management_portal/meeting_room_reservations/1.json
  def show
  end

  # GET /management_portal/meeting_room_reservations/new
  def new
    @meeting_room_reservation = MeetingRoomReservation.new
  end

  # GET /management_portal/meeting_room_reservations/1/edit
  def edit
  end

  # POST /management_portal/meeting_room_reservations or /management_portal/meeting_room_reservations.json
  def create
    @meeting_room_reservation = MeetingRoomReservation.new(meeting_room_reservation_params)

    respond_to do |format|
      if @meeting_room_reservation.save
        format.html { redirect_to @meeting_room_reservation, notice: "Meeting room reservation was successfully created." }
        format.json { render :show, status: :created, location: @meeting_room_reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meeting_room_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /management_portal/meeting_room_reservations/1 or /management_portal/meeting_room_reservations/1.json
  def update
    respond_to do |format|
      if @meeting_room_reservation.update(meeting_room_reservation_params)
        format.html { redirect_to @meeting_room_reservation, notice: "Meeting room reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @meeting_room_reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meeting_room_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /management_portal/meeting_room_reservations/1 or /management_portal/meeting_room_reservations/1.json
  def destroy
    @meeting_room_reservation.destroy
    respond_to do |format|
      format.html { redirect_to meeting_room_reservations_url, notice: "Meeting room reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_room_reservation
      @meeting_room_reservation = MeetingRoomReservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meeting_room_reservation_params
      params.fetch(:meeting_room_reservation, {})
    end
end
