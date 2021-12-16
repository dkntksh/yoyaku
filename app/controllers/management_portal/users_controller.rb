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
    begin
      @user = User.find_or_initialize_by(id: params[:id])
      unless @user.update_attributes(user_params)
       Rails.logger.error 'update valid error'
       Rails.logger.error @user.errors.full_messages
       render edit_management_portal_user_path and return
      end
     rescue ActiveRecord::RecordInvalid
       Rails.logger.error 'update ActiveRecord::RecordInvalid error'
       Rails.logger.error @user.errors
       render edit_management_portal_user_path and return
     rescue => e
       Rails.logger.error 'update other error'
       Rails.logger.error e.message
       Rails.logger.error e.backtrace
       render edit_management_portal_user_path and return
     end
     redirect_to management_portal_user_path
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    Rails.logger.debug "!!!!!destroy user!!!!!"
    user = User.find(params[:id])
    user.destroy!
    redirect_to management_portal_users_path notice: 'ユーザを削除しました。'
  end

  private

  def set_form_data
    @departments = Department.all.order(:name)  
  end

  def user_params
    params.require(:user).permit(:id, :name, :password, :department_id, :email, :password)
  end
end
