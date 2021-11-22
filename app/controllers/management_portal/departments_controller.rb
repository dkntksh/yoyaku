class ManagementPortal::DepartmentsController < ApplicationController
  before_action :is_management_portal_login?

  def index
    # TODO:初期表示の取得は要修正
    @departments = Department.all
  end

  def new
    @departments = Department.new
  end

  def create
  end

  def edit
    @departments = Department.find(params[:id])
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
