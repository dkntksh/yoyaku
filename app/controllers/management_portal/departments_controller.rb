class ManagementPortal::DepartmentsController < ApplicationController
  before_action :is_management_portal_login?

  def index
    # TODO:初期表示の取得は要修正
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    begin
     @department = Department.new(department_params)
     if @department.invalid?
      Rails.logger.error 'valid error'
      Rails.logger.error @department.errors.full_messages
      render management_portal_departments_new_path and return
    end
     @department.save!
    rescue ActiveRecord::RecordInvalid
      Rails.logger.error 'ActiveRecord::RecordInvalid error'
      Rails.logger.error @department.errors
      render management_portal_departments_new_path and return
    rescue => e
      Rails.logger.error 'other error'
      Rails.logger.error e.message
      Rails.logger.error e.backtrace
      render management_portal_departments_new_path and return
    end
    redirect_to management_portal_departments_path
  end

  def edit
    @department = Department.find(params[:id])
  end

  def detail
  end

  def delete
  end

  private
  def department_params
    params.require(:department).permit(:name, :department_code)
  end
  
end
