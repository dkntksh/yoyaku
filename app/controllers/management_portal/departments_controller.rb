class ManagementPortal::DepartmentsController < ApplicationController
  before_action :is_management_portal_login?

  def index
    # TODO:初期表示の取得は要修正
    @departments = Department.all
  end

  def create
  end

  def edit
  end

  def detail
  end

  def delete
  end
  
end
