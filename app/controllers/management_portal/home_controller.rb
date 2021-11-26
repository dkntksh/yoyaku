class ManagementPortal::HomeController < ApplicationController
  before_action :is_management_portal_login?

  def index
  end
end
