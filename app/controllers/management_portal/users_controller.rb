class ManagementPortal::UsersController < ApplicationController
  before_action :is_management_portal_login?
  before_action :set_form_data, only: [:new, :create, :edit]

  def index
    @users = User.order(id: :asc).page(1).per(20)
  end

  def new
    @user = User.new
  end

  def create
    begin
      @user = User.new(user_params)
      if @user.invalid?
       Rails.logger.error 'valid error'
       Rails.logger.error @user.errors.full_messages
       render management_portal_users_new_path and return
     end
      @user.save!
     rescue ActiveRecord::RecordInvalid
       Rails.logger.error 'ActiveRecord::RecordInvalid error'
       Rails.logger.error @user.errors
       render management_portal_users_new_path and return
     rescue => e
       Rails.logger.error 'other error'
       Rails.logger.error e.message
       Rails.logger.error e.backtrace
       render management_portal_users_new_path and return
     end
     redirect_to management_portal_user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def set_form_data
    @departments = Department.all.order(:name)
  end

  def user_params
    params.require(:user).permit(:id, :name, :password, :department_id, :email)
  end
end
