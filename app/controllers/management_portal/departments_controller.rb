class ManagementPortal::DepartmentsController < ApplicationController
  before_action :is_management_portal_login?

  def index
    # TODO:初期表示の取得は要修正
    @departments = Department.without_root.order(id: :asc).page(1).per(20)
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
    redirect_to management_portal_department_path(@department.id)
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    begin
      @department = Department.find_or_initialize_by(id: params[:id])
      unless @department.update_attributes(department_params)
       Rails.logger.error 'update valid error'
       Rails.logger.error @department.errors.full_messages
       render edit_management_portal_department_path and return
     end
     rescue ActiveRecord::RecordInvalid
       Rails.logger.error 'update ActiveRecord::RecordInvalid error'
       Rails.logger.error @department.errors
       render edit_management_portal_department_path and return
     rescue => e
       Rails.logger.error 'update other error'
       Rails.logger.error e.message
       Rails.logger.error e.backtrace
       render edit_management_portal_department_path and return
     end
     redirect_to management_portal_department_path
  end

  def show
    @department = Department.find(params[:id])
  end

  def detail
  end

  def delete
  end

  private
  def department_params
    params.require(:department).permit(:id, :name, :department_code)
  end
  
end
