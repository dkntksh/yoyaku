class ApplicationController < ActionController::Base

  # ManagementPortalにログインしているかを判定
  # ログインしていない場合、ログイン画面へリダイレクト
  def is_management_portal_login?
    redirect_to login_index if session[:admin_user_id].nil?
  end


end
