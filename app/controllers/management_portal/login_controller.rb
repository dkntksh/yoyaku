class ManagementPortal::LoginController < ApplicationController
  def index
  end

  def login
    name = login_params[:name]
    admin_user = AdminUser.find_by(name: name)
    # パスワードの認証
    if admin_user.present? 
      if admin_user.authenticate(login_params[:password])
        # ログイン処理
        session[:admin_user_id] = admin_user.id
        session[:admin_user_name] = admin_user.name
        admin_user.login_error_count = 0
        admin_user.save!
      else
        admin_user.login_error_count = admin_user.login_error_count.to_i + 1
        if admin_user.login_error_count >= 5
          admin_user.lock_datetime_to = Time.now + 10.minute
          @error = 'ユーザがロックされています。10分後にアクセスしてください。'
        else
          @error = 'ユーザが存在しないか、パスワードが誤っています。'
        end
        render :index
      end
    else
      @error = 'ユーザが存在しないか、パスワードが誤っています。'
      render :index
    end

    # home画面へ遷移
    redirect_to management_portal_home_path
  end

  def login_params
    params.require(:admin_user).permit(:name, :password)
  end
end
