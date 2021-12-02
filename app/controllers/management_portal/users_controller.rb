class ManagementPortal::UsersController < ApplicationController

  def index
    @users = User.order(id: :asc).page(1).per(20)
  end

  def new
  end

  def edit
  end

  def show
  end

end
