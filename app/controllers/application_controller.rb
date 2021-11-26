class ApplicationController < ActionController::Base

  # ManagementPortalにログインしているかを判定
  # ログインしていない場合、ログイン画面へリダイレクト
  def is_management_portal_login?
    redirect_to management_portal_login_path if session[:admin_user_id].nil?
  end


end
